DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;

CREATE TABLE users(
user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_type ENUM('Premium', 'Free') NOT NULL,
email VARCHAR(100) NOT NULL,
user_password VARCHAR(15) NOT NULL,
user_name VARCHAR(25) NOT NULL,
birthdate DATE NOT NULL,
gender ENUM ('Male', 'Female', 'Nonbinary', 'None of the above', 'Prefer not to answer') NOT NULL,
country VARCHAR(100) NOT NULL,
zip_code INT NOT NULL
);

CREATE TABLE premium_sub (
subscription_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
subscription_start DATE NOT NULL,
renovation_date DATE NOT NULL,
payment_form ENUM('Credit card', 'PayPal') NOT NULL,
FOREIGN KEY(user_id) REFERENCES users (user_id)
);

CREATE TABLE credit_card(
card_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
card_num VARCHAR(100) NOT NULL,
expiration_date DATE NOT NULL,
security_code INT NOT NULL
);

CREATE TABLE paypal(
paypal_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(100) NOT NULL
);

CREATE TABLE reg_payments(
order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
subscription_id INT NOT NULL,
card_id INT,
paypal_id INT,
payment_date DATE NOT NULL,
total INT NOT NULL,
FOREIGN KEY (subscription_id) REFERENCES premium_sub (subscription_id),
FOREIGN KEY (card_id) REFERENCES credit_card (card_id),
FOREIGN KEY (paypal_id) REFERENCES paypal (paypal_id)
);

CREATE TABLE artists(
artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
artist_name VARCHAR(100) NOT NULL,
artist_image VARCHAR(100) NOT NULL,
related_artists_id INT
);

ALTER TABLE artist
ADD FOREIGN KEY (related_artists_id) REFERENCES artists (artist_id);

CREATE TABLE albums(
album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
artist_id INT NOT NULL,
publication_date DATE NOT NULL,
image VARCHAR(100),
FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE playlists(
playlist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
title VARCHAR(100) NOT NULL,
num_songs INT NOT NULL,
creation_date DATE NOT NULL,
status_type ENUM('Deleted', 'Active') NOT NULL,
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE songs(
song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
album_id INT NOT NULL,
title VARCHAR(100) NOT NULL,
duration FLOAT NOT NULL,
num_streams INT NOT NULL,
playlist_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums (album_id),
FOREIGN KEY (playlist_id) REFERENCES playlists (playlist_id)
);

CREATE TABLE deleted_playlists(
deleted_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
playlist_id INT NOT NULL,
deleted_date DATE NOT NULL,
FOREIGN KEY (playlist_id) REFERENCES playlists (playlist_id)
);

CREATE TABLE active_playlists(
active_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
playlist_id INT NOT NULL,
user_added_song_id INT NOT NULL,
added_song_date DATE NOT NULL,
FOREIGN KEY (playlist_id) REFERENCES playlists (playlist_id),
FOREIGN KEY (user_added_song_id) REFERENCES users (user_id)
);

CREATE TABLE user_shared_playlist(
shared_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
shared_playlist_id INT NOT NULL,
FOREIGN KEY (shared_playlist_id) REFERENCES active_playlists (active_id),
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE user_favs(
favs_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL UNIQUE,
fav_song_id INT NOT NULL UNIQUE,
fav_album_id INT NOT NULL UNIQUE,
fav_artist_id INT NOT NULL UNIQUE,
FOREIGN KEY (user_id) REFERENCES users (user_id),
FOREIGN KEY (fav_song_id) REFERENCES songs (song_id),
FOREIGN KEY (fav_album_id) REFERENCES albums (album_id),
FOREIGN KEY (fav_artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE user_follows(
follow_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users (user_id),
FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

INSERT INTO users (user_type, email, user_password, user_name, birthdate, gender, country, zip_code)
VALUES
(1, 'lauraglto@gmail.com', '******', 'lauraglto', '1999-07-19', 2, 'Spain', 08032),
(1, 'mateogl98@gmail.com', '*********', 'mateosmusic', '1998-02-03', 1, 'Italy', 30100);

INSERT INTO premium_sub (user_id, subscription_start, renovation_date, payment_form)
VALUES (1, '2020-06-27', '2023-06-27', 1), (2, '2022-08-19', '2024-08-19', 2);

INSERT INTO credit_card(card_num, expiration_date, security_code)
VALUES
('5412 7512 3412 3456', '01-12-28', 041);

INSERT INTO paypal(user_name)
VALUES ('mateogl98');

INSERT INTO reg_payments(subscription_id, card_id, paypal_id, payment_date, total)
VALUES (1, 1, NULL, '2020-06-27', 12.99), (1, 1, NULL, '2023-06-27', 12.99), (2, NULL, 1, '2024-08-19', 12.99);

 INSERT INTO artists(artist_name, artist_image, related_artists_id)
VALUES ('Twenty One Pilots', 'image', NULL), ('Sabrina Carpenter', 'image', NULL), ('Dove Cameron', 'image', 2);

INSERT INTO albums(title, artist_id, publication_date, image)
VALUES
('Clancy', 1, '2024-05-14', 'image'), ('Blurryface', 1, '2015-05-14', 'image'), ("Short n'Sweet", 2, '2024-08-23', 'image');

INSERT INTO playlists(user_id, title, num_songs, creation_date, status_type)
VALUES 
(1, 'MorningMusic', 54,  '2021-07-14', 2), (1, "Mateo's Music", 78, '2022-09-18', 1);

INSERT INTO songs(album_id, title, duration, num_streams, playlist_id)
VALUES (3, 'Taste', 2.37, 135277919, 1), (3, 'Espresso', 2.55, 1228603617, 1), (2, 'Doubt', 3.11, 289821789, 1);

INSERT INTO deleted_playlists(playlist_id, deleted_date)
VALUES (2, '2023-06-24');

INSERT INTO active_playlists(playlist_id, user_added_song_id, added_song_date)
VALUES (1, 2, '2023-07-18');

INSERT INTO user_shared_playlist(user_id, shared_playlist_id)
VALUES (1, 1);

INSERT INTO user_favs(user_id, fav_song_id, fav_album_id, fav_artist_id)
VALUES (1, 2, 3, 2);
