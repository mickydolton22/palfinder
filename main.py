import os
import json
from datetime import date
from flask import Flask, render_template, request, redirect, url_for, session, flash, abort, jsonify
from flask_wtf import CSRFProtect
from werkzeug.utils import secure_filename
import bcrypt
from database_manager import (
    create_user, get_user_by_username, get_all_pets, create_pet, get_random_available_pet,
    create_pet_submission, get_pending_submissions, approve_submission, deny_submission,
    get_notifications, mark_notifications_read
)

app = Flask(__name__)
app.secret_key = 'change-this-to-a-random-secret-key'
csrf = CSRFProtect(app)

UPLOAD_FOLDER = os.path.join(app.root_path, 'static', 'images')
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}


def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/')
def homepage():
    featured_pet = get_random_available_pet()
    return render_template('homepage.html', featured_pet=featured_pet)

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['userpassword']
        confirm_password = request.form['confirmuserpassword']

        if password != confirm_password:
            flash('Passwords do not match.')
            return redirect(url_for('signup'))

        password_hash = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

        if create_user(username, password_hash):
            return redirect(url_for('login'))
        else:
            flash('Username already taken.')
            return redirect(url_for('signup'))

    return render_template('signup.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['userpassword']
        user = get_user_by_username(username)

        if user is None:
            flash('No account found with that username.')
            return redirect(url_for('login'))

        if not bcrypt.checkpw(password.encode('utf-8'), user['userpassword'].encode('utf-8')):
            flash('Incorrect password.')
            return redirect(url_for('login'))

        session['username'] = user['username']
        session['is_developer'] = bool(user['is_developer'])
        return redirect(url_for('homepage'))

    return render_template('loginpage.html')


@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))


@app.route('/mission')
def mission():
    return render_template('missionstatement.html')


@app.route('/petdatabase')
def petdatabase():
    pets = get_all_pets()
    pets_list = [dict(pet) for pet in pets]
    return render_template('petdatabase.html', pets_json=json.dumps(pets_list))


@app.route('/registerpet', methods=['POST'])
def registerpet():
    if 'username' not in session:
        flash('You must be logged in to register a pet.')
        return redirect(url_for('login'))

    name = request.form['name']
    species = request.form['species']
    age = request.form['age']
    availability = request.form['adoption_availability']
    description = request.form['description']
    image_file = request.files.get('image')

    if not image_file or image_file.filename == '' or not allowed_file(image_file.filename):
        flash('Please upload a valid image file (png, jpg, jpeg, or gif).')
        return redirect(url_for('petdatabase'))

    filename = secure_filename(image_file.filename)
    image_file.save(os.path.join(UPLOAD_FOLDER, filename))

    intake_date = date.today().isoformat()

    create_pet_submission(name, species, age, intake_date, availability, filename, description, session['username'])
    flash(f'{name} has been submitted for review! You will be notified once a decision is made.')
    return redirect(url_for('petdatabase'))

@app.route('/developer')
def developer():
    if not session.get('is_developer'):
        abort(403)
    submissions = get_pending_submissions()
    return render_template('developerpage.html', submissions=submissions)

@app.route('/developer/approve/<int:submission_id>', methods=['POST'])
def approve_pet(submission_id):
    if not session.get('is_developer'):
        abort(403)
    approve_submission(submission_id)
    flash('Submission approved.')
    return redirect(url_for('developer'))


@app.route('/developer/deny/<int:submission_id>', methods=['POST'])
def deny_pet(submission_id):
    if not session.get('is_developer'):
        abort(403)
    deny_submission(submission_id)
    flash('Submission denied.')
    return redirect(url_for('developer'))


@app.route('/notifications')
def notifications():
    if 'username' not in session:
        return jsonify({'notifications': [], 'unread_count': 0})
    notifs = [dict(n) for n in get_notifications(session['username'])]
    unread = sum(1 for n in notifs if not n['is_read'])
    return jsonify({'notifications': notifs, 'unread_count': unread})


@app.route('/notifications/read', methods=['POST'])
@csrf.exempt
def notifications_read():
    if 'username' in session:
        mark_notifications_read(session['username'])
    return jsonify({'success': True})

@app.route('/petpersonalityquiz', methods=['GET', 'POST'])
def petpersonalityquiz():
    if request.method == 'POST':
        selected_tags = [value for key, value in request.form.items()
                          if key.startswith('trait_') and value]

        pets = [dict(p) for p in get_all_pets()]
        available_pets = [p for p in pets if p['adoption_availability'] == 'Available']

        scored = []
        for pet in available_pets:
            pet_tags = pet['description'].split(' ')
            score = sum(1 for tag in selected_tags if tag in pet_tags)
            if score > 0:
                scored.append((score, pet))

        scored.sort(key=lambda x: x[0], reverse=True)
        matches = [pet for score, pet in scored[:5]]

        return render_template('petpersonalityquiz.html', submitted=True, matches=matches)

    return render_template('petpersonalityquiz.html', submitted=False, matches=None)

if __name__ == '__main__':
    app.run(debug=True)

