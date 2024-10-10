DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;

CREATE TABLE users(
user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_name VARCHAR(50) NOT NULL,
UNIQUE(user_name),
email VARCHAR(50) NOT NULL,
UNIQUE(email),
user_password VARCHAR(12) NOT NULL,
birthday_date DATETIME NOT NULL,
gender ENUM('Male', 'Female', 'Non Binary', 'Others', 'Don´t want to answer') NOT NULL,
country VARCHAR(50) NOT NULL,
zip_code INT NOT NULL
);

CREATE TABLE videos(
video_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
video_description VARCHAR(300) NOT NULL,
user_id INT NOT NULL,
file_size FLOAT NOT NULL,
file_name VARCHAR(100) NOT NULL,
duration TIME NOT NULL,
thumbnail VARCHAR(150) NOT NULL,
views INT NOT NULL,
likes INT NOT NULL,
dislikes INT NOT NULL,
visibility ENUM('Public', 'Hidden', 'Private') NOT NULL,
publish_date DATETIME NOT NULL,
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE tags(
tag_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
tag_name VARCHAR (20) UNIQUE,
video_id INT NOT NULL,
FOREIGN KEY (video_id) REFERENCES videos (video_id)
);

CREATE TABLE channels(
channel_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
channel_name VARCHAR(50) NOT NULL,
user_id INT NOT NULL,
channel_descrip VARCHAR(300) NOT NULL,
creation_date DATETIME NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE subscriptions(
subscription_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
channel_suscribed_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users (user_id),
FOREIGN KEY (channel_suscribed_id) REFERENCES channels (channel_id)
);

CREATE TABLE video_likes_dislikes(
likes_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
video_id INT NOT NULL,
user_id INT NOT NULL,
like_type ENUM('like', 'dislike') NOT NULL,
like_date DATETIME NOT NULL,
FOREIGN KEY (video_id) REFERENCES videos (video_id),
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE playlists(
playlist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
playlist_name VARCHAR(100) NOT NULL,
visibility ENUM('public', 'private') NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE comments(
comment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
comment_text VARCHAR(500) NOT NULL,
comment_date DATETIME NOT NULL,
user_made_comment_id INT NOT NULL,
video_id INT NOT NULL,
FOREIGN KEY (user_made_comment_id) REFERENCES users (user_id),
FOREIGN KEY (video_id) REFERENCES videos (video_id)
);

CREATE TABLE comment_like_dislike(
comment_like_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
comment_id INT NOT NULL,
user_id INT NOT NULL,
like_dislike ENUM('like', 'dislike') NOT NULL,
comment_like_date DATETIME NOT NULL,
FOREIGN KEY (comment_id) REFERENCES comments (comment_id),
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

CREATE TABLE playlist_has_videos(
playlist_has_videos_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
video_id INT NOT NULL,
playlist_id INT NOT NULL,
FOREIGN KEY (video_id) REFERENCES videos (video_id),
FOREIGN KEY (playlist_id) REFERENCES playlists (playlist_id),
UNIQUE(video_id, playlist_id)
);

INSERT INTO users (user_name, email, user_password, birthday_date, gender, country, zip_code)
VALUES
('moderntimespie', 'andypie4455@gmail.com', '*******', '1997-05-06', 2, 'Spain', 08034),
('dorasmap96', 'gemmsrf_96@gmail.com', '*********', '1996-12-14', 2, 'Italy', 001999),
('danivalorX', 'danigalo_00@gmail.com', '******', '2000-08-24', 1, 'Spain', 01001);

INSERT INTO videos (title, video_description, user_id, file_size, file_name, duration, thumbnail, views, likes, dislikes, visibility, publish_date)
VALUES
('Productive 5AM morning routine VLOG', 'HIII this has been my recent routine while living alone & working from home !!', 2, 1.89, 'morningRoutine_vlog1', '11:02:55', 'image', 21000, 912, 89, 1, '2024-07-17 17:05:44');

INSERT INTO tags(tag_name, video_id)
VALUES ('morningroutine', 1), ('Productivity', 1);

INSERT INTO channels(channel_name, user_id, channel_descrip, creation_date)
VALUES
('DailyGemms', 2, 'Vlogs & More', '2020-06-18'), ('AndyReadsALot', 1, 'Reading and cozy Vlogs, Books Recommendations & More', '2019-02-11');

INSERT INTO subscriptions (user_id, channel_suscribed_id)
VALUES(3, 2), (1, 2);

INSERT INTO video_likes_dislikes(video_id, user_id, like_type, like_date)
VALUES (1, 1, 1, '2024-07-18');

INSERT INTO playlists (playlist_name, visibility, user_id)
VALUES ('Motivation', 2, 1);

INSERT INTO comments (comment_text, comment_date, user_made_comment_id, video_id)
VALUES ('who else loves Gemm?', '2024-07-18', 1, 1);

INSERT INTO comment_like_dislike (comment_id, user_id, like_dislike, comment_like_date)
VALUES (1, 3, 1, '2024-07-19');

INSERT INTO playlist_has_videos (video_id, playlist_id)
VALUES (1, 1);
