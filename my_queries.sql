USE data_source.db;
CREATE TABLE IF NOT EXISTS pet_info (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    species VARCHAR(30) NOT NULL,
    age INTEGER NOT NULL,
    date_of_intake DATE NOT NULL,
    adoption_availability VARCHAR(20) NOT NULL,
    image VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL
);
 
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Rusty', 'Bird', 10, '2025-09-25', 'Available', 'pet1.jpg', 'Energetic Curious Social');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Oliver', 'Cat', 1, '2024-02-16', 'Available', 'pet2.jpg', 'Shy Calm Affectionate');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Willow', 'Cat', 1, '2025-01-24', 'Available', 'pet3.jpg', 'Vocal Playful Curious');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Molly', 'Dog', 5, '2024-12-29', 'Available', 'pet4.jpg', 'Protective Loyal Energetic');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Bear', 'Dog', 8, '2026-01-16', 'Available', 'pet5.jpg', 'Energetic Obedient Cuddly');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Willow 2', 'Cat', 4, '2026-08-05', 'Adopted', 'pet6.jpg', 'Affectionate Playful Independent');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Shadow', 'Cat', 3, '2026-04-21', 'Available', 'pet7.jpg', 'Playful Quiet Shy');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Nala', 'Cat', 1, '2024-08-04', 'Adopted', 'pet8.jpg', 'Playful Affectionate Vocal');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Pumpkin', 'Cat', 6, '2026-06-24', 'Pending', 'pet9.jpg', 'Curious Shy Gentle');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Maggie', 'Dog', 3, '2026-02-01', 'Adopted', 'pet10.jpg', 'Curious Protective Cuddly');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Coco', 'Dog', 9, '2025-02-12', 'Available', 'pet11.jpg', 'Gentle Energetic Obedient');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Biscuit', 'Dog', 1, '2026-02-12', 'Available', 'pet12.jpg', 'Loyal Energetic Curious');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Ash', 'Cat', 12, '2025-11-27', 'Pending', 'pet13.jpg', 'Gentle Calm Quiet');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Thumper', 'Rabbit', 6, '2025-09-02', 'Pending', 'pet14.jpg', 'Playful Curious Quiet');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Mochi', 'Cat', 10, '2026-01-08', 'Available', 'pet15.jpg', 'Aloof Shy Playful');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Nibbles', 'Guinea Pig', 1, '2024-10-27', 'Pending', 'pet16.jpg', 'Gentle Timid Quiet');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Max', 'Dog', 11, '2026-06-15', 'Available', 'pet17.jpg', 'Curious Energetic Loyal');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Shadow 2', 'Cat', 10, '2024-11-01', 'Adopted', 'pet18.jpg', 'Gentle Affectionate Curious');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Luna', 'Dog', 5, '2026-02-19', 'Available', 'pet19.jpg', 'Curious Affectionate Playful');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Bella', 'Dog', 9, '2024-11-27', 'Pending', 'pet20.jpg', 'Playful Loyal Friendly');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Loki', 'Cat', 12, '2024-11-10', 'Available', 'pet21.jpg', 'Independent Affectionate Calm');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Buddy', 'Dog', 1, '2026-01-19', 'Pending', 'pet22.jpg', 'Loyal Curious Energetic');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Cinnamon', 'Rabbit', 2, '2025-11-06', 'Pending', 'pet23.jpg', 'Playful Gentle Curious');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Tiger', 'Cat', 8, '2026-06-12', 'Adopted', 'pet24.jpg', 'Quiet Affectionate Aloof');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Simba', 'Cat', 11, '2024-11-15', 'Pending', 'pet25.jpg', 'Playful Vocal Aloof');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Nala 2', 'Cat', 1, '2024-09-10', 'Available', 'pet26.jpg', 'Calm Playful Independent');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Biscuit 2', 'Dog', 9, '2025-07-21', 'Available', 'pet27.jpg', 'Affectionate Gentle Playful');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Max 2', 'Dog', 1, '2025-12-25', 'Available', 'pet28.jpg', 'Gentle Loyal Playful');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Simba 2', 'Cat', 5, '2024-03-13', 'Adopted', 'pet29.jpg', 'Affectionate Shy Vocal');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Bella 2', 'Dog', 3, '2025-07-06', 'Available', 'pet30.jpg', 'Affectionate Obedient Gentle');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Jack', 'Dog', 12, '2025-04-29', 'Pending', 'pet31.jpg', 'Gentle Loyal Curious');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Cleo', 'Cat', 10, '2025-03-17', 'Available', 'pet32.jpg', 'Quiet Gentle Vocal');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Pebbles', 'Rabbit', 11, '2024-02-25', 'Available', 'pet33.jpg', 'Quiet Timid Curious');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Pepper', 'Cat', 12, '2026-06-01', 'Available', 'pet34.jpg', 'Affectionate Gentle Aloof');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Duke', 'Dog', 8, '2025-04-04', 'Available', 'pet35.jpg', 'Cuddly Energetic Protective');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Clover', 'Rabbit', 7, '2024-09-12', 'Available', 'pet36.jpg', 'Timid Playful Quiet');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Skye', 'Guinea Pig', 0, '2025-10-29', 'Adopted', 'pet37.jpg', 'Quiet Curious Timid');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Ginger', 'Cat', 2, '2025-02-20', 'Pending', 'pet38.jpg', 'Vocal Affectionate Quiet');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Charlie', 'Dog', 0, '2024-06-17', 'Pending', 'pet39.jpg', 'Playful Cuddly Protective');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Sadie', 'Dog', 12, '2026-03-14', 'Pending', 'pet40.jpg', 'Protective Cuddly Obedient');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Peanut', 'Bird', 2, '2024-07-13', 'Available', 'pet41.jpg', 'Curious Vocal Social');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Oliver 2', 'Cat', 11, '2025-07-09', 'Available', 'pet42.jpg', 'Playful Independent Aloof');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Luna 2', 'Dog', 9, '2025-05-03', 'Adopted', 'pet43.jpg', 'Curious Energetic Playful');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Smokey', 'Cat', 8, '2024-03-23', 'Available', 'pet44.jpg', 'Calm Gentle Affectionate');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Hazel', 'Rabbit', 6, '2024-05-02', 'Adopted', 'pet45.jpg', 'Gentle Playful Quiet');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Charlie 2', 'Dog', 9, '2024-03-24', 'Pending', 'pet46.jpg', 'Affectionate Curious Friendly');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Boots', 'Cat', 4, '2024-07-28', 'Available', 'pet47.jpg', 'Affectionate Shy Quiet');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Splash', 'Bird', 2, '2025-11-18', 'Available', 'pet48.jpg', 'Independent Social Vocal');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Daisy', 'Dog', 0, '2025-04-14', 'Adopted', 'pet49.jpg', 'Affectionate Loyal Curious');
INSERT INTO pet_info (name, species, age, date_of_intake, adoption_availability, image, description) VALUES ('Tiger 2', 'Cat', 8, '2024-08-06', 'Adopted', 'pet50.jpg', 'Shy Curious Playful');