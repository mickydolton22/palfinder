import sqlite3
import random
from datetime import datetime

DB_PATH = 'data_source.db'

def get_db_connection():
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn

def create_user(username, password_hash):
    conn = get_db_connection()
    try:
        conn.execute(
            'INSERT INTO login_info (username, userpassword) VALUES (?, ?)',
            (username, password_hash)
        )
        conn.commit()
        return True
    except sqlite3.IntegrityError:
        return False
    finally:
        conn.close()

def get_user_by_username(username):
    conn = get_db_connection()
    user = conn.execute('SELECT * FROM login_info WHERE username = ?', (username,)).fetchone()
    conn.close()
    return user

def get_all_pets():
    conn = get_db_connection()
    pets = conn.execute('SELECT * FROM pet_info').fetchall()
    conn.close()
    return pets

def create_pet(name, species, age, date_of_intake, adoption_availability, image, description):
    conn = get_db_connection()
    conn.execute(
        'INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES (?, ?, ?, ?, ?, ?, ?)',
        (name, species, age, date_of_intake, adoption_availability, image, description)
    )
    conn.commit()
    conn.close()

def get_random_available_pet():
    conn = get_db_connection()
    pets = conn.execute(
        "SELECT * FROM pet_info WHERE adoption_availability = 'Available'"
    ).fetchall()
    conn.close()
    if not pets:
        return None
    return random.choice(pets)

def create_pet_submission(name, species, age, date_of_intake, adoption_availability, image, description, submitted_by):
    conn = get_db_connection()
    conn.execute(
        'INSERT INTO pet_submissions (name, species, age, date_of_intake, adoption_availability, image, description, submitted_by, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)',
        (name, species, age, date_of_intake, adoption_availability, image, description, submitted_by, 'Pending')
    )
    conn.commit()
    conn.close()

def get_pending_submissions():
    conn = get_db_connection()
    rows = conn.execute("SELECT * FROM pet_submissions WHERE status = 'Pending'").fetchall()
    conn.close()
    return rows

def get_submission_by_id(submission_id):
    conn = get_db_connection()
    row = conn.execute("SELECT * FROM pet_submissions WHERE id = ?", (submission_id,)).fetchone()
    conn.close()
    return row

def approve_submission(submission_id):
    submission = get_submission_by_id(submission_id)
    if submission is None:
        return False
    create_pet(submission['name'], submission['species'], submission['age'],
               submission['date_of_intake'], submission['adoption_availability'],
               submission['image'], submission['description'])
    conn = get_db_connection()
    conn.execute("UPDATE pet_submissions SET status = 'Approved' WHERE id = ?", (submission_id,))
    conn.commit()
    conn.close()
    create_notification(submission['submitted_by'], f"Your pet '{submission['name']}' has been approved and added to the database!")
    return True

def deny_submission(submission_id):
    submission = get_submission_by_id(submission_id)
    if submission is None:
        return False
    conn = get_db_connection()
    conn.execute("UPDATE pet_submissions SET status = 'Denied' WHERE id = ?", (submission_id,))
    conn.commit()
    conn.close()
    create_notification(submission['submitted_by'], f"Your pet '{submission['name']}' submission was not approved.")
    return True

def create_notification(username, message):
    conn = get_db_connection()
    conn.execute(
        'INSERT INTO notifications (username, message, is_read, created_at) VALUES (?, ?, 0, ?)',
        (username, message, datetime.now().strftime('%d %b %Y, %H:%M'))
    )
    conn.commit()
    conn.close()

def get_notifications(username):
    conn = get_db_connection()
    rows = conn.execute("SELECT * FROM notifications WHERE username = ? ORDER BY id DESC", (username,)).fetchall()
    conn.close()
    return rows

def mark_notifications_read(username):
    conn = get_db_connection()
    conn.execute("UPDATE notifications SET is_read = 1 WHERE username = ?", (username,))
    conn.commit()
    conn.close()