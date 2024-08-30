CREATE DATABASE socialmedia;
DROP DATABASE socialmedia;
USE socialmedia;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    profile_picture VARCHAR(255),
    bio VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE users;
INSERT INTO users (username, email, password, profile_picture, bio)
VALUES
('Gomathi', 'goma@example.com', 'password123', 'profile1.jpg', 'Love to travel and take pictures.'),
('Janarthini', 'jana@example.com', 'password456', 'profile2.jpg', 'Foodie and book lover.'),
('Moulidharan', 'mouli@example.com', 'password789', 'profile3.jpg', 'Fitness enthusiast.'),
('MadhanRaj', 'madhan@example.com', 'password101', 'profile4.jpg', 'Graphic designer and artist.'),
('Srimathi', 'sri@example.com', 'password112', 'profile5.jpg', 'Technology geek.'),
('Arun', 'arun@example.com', 'password131', 'profile6.jpg', 'Fashion and beauty blogger.'),
('Thamayanthi', 'thamu@example.com', 'password415', 'profile7.jpg', 'Adventure seeker.'),
('Devisri', 'devi@example.com', 'password161', 'profile8.jpg', 'Photographer and storyteller.'),
('Deepa', 'deep@example.com', 'password718', 'profile9.jpg', 'Music lover.'),
('Nandhu', 'nandy@example.com', 'password920', 'profile10.jpg', 'Professor.');


CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
	hashtag_id INT,
    image_url VARCHAR(255) NOT NULL,
    caption TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
SELECT*FROM posts;
INSERT INTO posts (user_id,  hashtag_id, image_url, caption)
VALUES
(1,1, 'post1.jpg', 'Exploring the mountains.'),
(2, 2,'post2.jpg', 'Delicious pasta recipe.'),
(3, 3,'post3.jpg', 'Morning workout routine.'),
(4,4, 'post4.jpg', 'My latest art project.'),
(5, 5,'post5.jpg', 'New tech gadgets.'),
(6, 6,'post6.jpg', 'Summer fashion trends.'),
(7, 7,'post7.jpg', 'Skydiving adventure!'),
(8, 8,'post8.jpg', 'Capturing the sunset.'),
(9, 9,'post9.jpg', 'Live concert last night.'),
(10, 10,'post10.jpg', 'Baking a chocolate cake.');


CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
);

INSERT INTO comments (post_id, user_id, comment_text)
VALUES
(1, 2, 'Wow, that looks amazing!'),
(2, 1, 'I need to try this recipe!'),
(3, 4, 'Great job, keep it up!'),
(4, 5, 'Your art is stunning!'),
(5, 6, 'I want that gadget.'),
(6, 8, 'This outfit is perfect!'),
(7, 7, 'So brave of you!'),
(8, 9, 'Beautiful shot.'),
(9, 10, 'What a performance!'),
(10, 3, 'Incredible view!');


CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ,
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
);

INSERT INTO likes (post_id, user_id)
VALUES
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(5, 10),
(5, 1);


CREATE TABLE followers (
    follower_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    follower_user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (follower_user_id) REFERENCES users(user_id) 
);

INSERT INTO followers (user_id, follower_user_id)
VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10);


CREATE TABLE hashtags (
    hashtag_id INT AUTO_INCREMENT PRIMARY KEY,
    hashtag_text VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO hashtags (hashtag_text)
VALUES('#travel'),
('#food'),
('#fitness'),
('#art'),
('#technology'),
('#fashion'),
('#adventure'),
('#photography'),
('#music'),
('#baking');

CREATE TABLE direct_messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    receiver_id INT,
    message_text TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES users(user_id)
);

INSERT INTO direct_messages (sender_id, receiver_id, message_text)
VALUES
(1, 2, 'Hey, how are you?'),
(2, 1, 'I\'m good, thanks! What about you?'),
(3, 4, 'Can you share the project file?'),
(4, 3, 'Sure, I\'ll send it over.'),
(5, 6, 'Do you want to hang out this weekend?'),
(6, 5, 'Sounds great! Let\'s do it.'),
(7, 8, 'Happy Birthday! Have a great day!'),
(8, 7, 'Thank you so much!'),
(9, 10, 'Did you watch the game last night?'),
(10, 9, 'Yes, it was amazing!');


CREATE TABLE saved_posts (
    saved_post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    post_id INT,
    saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (post_id) REFERENCES posts(post_id)
);

INSERT INTO saved_posts (user_id, post_id)
VALUES
(1, 5),
(2, 3),
(3, 7),
(4, 2),
(5, 8),
(6, 1),
(7, 4),
(8, 6),
(9, 9),
(10, 10);


CREATE TABLE stories (
    story_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    image_url VARCHAR(255),
    video_url VARCHAR(255),
    caption TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO stories (user_id, image_url, video_url, caption, expires_at)
VALUES
(1, 'story1.jpg', NULL, 'Good morning everyone!', '2024-08-26 10:00:00'),
(2, NULL, 'video1.mp4', 'Check out this view!', '2024-08-26 12:00:00'),
(3, 'story2.jpg', NULL, 'Starting my workout routine.', '2024-08-26 15:00:00'),
(4, 'story3.jpg', NULL, 'My latest artwork.', '2024-08-26 18:00:00'),
(5, 'story4.jpg', NULL, 'New tech gadgets!', '2024-08-26 20:00:00'),
(6, NULL, 'video2.mp4', 'Summer fashion trends.', '2024-08-26 22:00:00'),
(7, 'story5.jpg', NULL, 'Adventure time!', '2024-08-27 08:00:00'),
(8, 'story6.jpg', NULL, 'Captured this sunset.', '2024-08-27 10:00:00'),
(9, 'story7.jpg', NULL, 'Live concert last night.', '2024-08-27 12:00:00'),
(10, 'story8.jpg', NULL, 'Baking a chocolate cake.', '2024-08-27 14:00:00');


CREATE TABLE notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    notification_type VARCHAR(50) NOT NULL,
    related_user_id INT,
    related_post_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (related_user_id) REFERENCES users(user_id),
    FOREIGN KEY (related_post_id) REFERENCES posts(post_id)
);

INSERT INTO notifications (user_id, notification_type, related_user_id, related_post_id)
VALUES
(1, 'like', 2, 1),
(2, 'comment', 3, 2),
(3, 'follow', 4, NULL),
(4, 'like', 5, 3),
(5, 'comment', 6, 4),
(6, 'follow', 7, NULL),
(7, 'like', 8, 5),
(8, 'comment', 9, 6),
(9, 'follow', 10, NULL),
(10, 'like', 1, 7);


CREATE TABLE group_details (
    group_id INT AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL UNIQUE,
    group_description TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(user_id)
);

INSERT INTO group_details (group_name, group_description, created_by)
VALUES
('Travel Enthusiasts', 'A group for people who love to travel and explore new places.', 1),
('Food Lovers', 'Share and discover delicious recipes and food tips.', 2),
('Fitness Freaks', 'A community for fitness enthusiasts to share tips and progress.', 3),
('Artists Hub', 'A place for artists to showcase their work and get feedback.', 4),
('Tech Geeks', 'Discuss the latest in technology and gadgets.', 5),
('Fashionistas', 'Share the latest fashion trends and outfit ideas.', 6),
('Adventure Seekers', 'For those who love thrill and adventure.', 7),
('Photography Lovers', 'A group for photographers to share their shots.', 8),
('Music Maniacs', 'Discuss and share your favorite music.', 9),
('Baking Buddies', 'A community for baking enthusiasts to share recipes and tips.', 10);


-- Here I joined the two tables which is named as posts and users
-- And I used the user_id for retrieving the information about each post, along with the username and profile picture of the user who created the post.
SELECT posts.post_id,users.username,users.profile_picture,posts.image_url,posts.caption,posts.created_at
FROM posts JOIN users ON posts.user_id = users.user_id;


-- Here I joined the two tables which is named as comments and users
-- I used the user_id in both tables for to fetch the comments made on a specific post, along with the username of each commenter.
SELECT comments.comment_id,users.username,comments.comment_text,comments.created_at FROM comments
JOIN users ON comments.user_id = users.user_id WHERE comments.post_id = 2;

-- Here I joined the two tables which is named as likes and posts
-- I used the post_id in both tables for to retrieve posts that have been liked by a specific user like with user_id = 2.
SELECT posts.post_id,posts.image_url,posts.caption,posts.created_at FROM likes
JOIN posts ON likes.post_id = posts.post_id WHERE likes.user_id = 2;

-- Here I joined the two tables which is named as followers, users
-- In this query, I make a self-join on the users table to retrieve the list of followers for a specific user with user_id = 3.
SELECT u1.username AS followed_user,u2.username AS follower_username,followers.created_at FROM followers
JOIN users u1 ON followers.user_id = u1.user_id JOIN users u2 ON followers.follower_user_id = u2.user_id
WHERE u1.user_id = 3;


-- In this query I joined the three tables are comments, posts, and users
-- tables to retrieve the usernames of all users who have commented on posts made by a specific user (with user_id = 1). 
SELECT users.username FROM comments JOIN posts ON comments.post_id = posts.post_id
JOIN users ON comments.user_id = users.user_id WHERE posts.user_id = 1;

-- This query retrieves the post_id, image_url, caption, and created_at of posts that are associated with the hashtag art.
SELECT posts.post_id,posts.image_url,posts.caption,posts.created_at FROM posts JOIN hashtags
ON posts.hashtag_id = hashtags.hashtag_id WHERE hashtags.hashtag_text = '#art';

-- This query retrieves all direct messages between two users with user_id 1 (sender) and user_id 2 (receiver).
SELECT dm.message_id, u1.username AS sender, u2.username AS receiver, dm.message_text, dm.sent_at
FROM direct_messages dm JOIN users u1 ON dm.sender_id = u1.user_id JOIN users u2 
ON dm.receiver_id = u2.user_id WHERE dm.sender_id = 1 AND dm.receiver_id = 2;

-- This query retrieves all saved posts by the user with user_id 1.
SELECT sp.saved_post_id, u.username, p.post_content, sp.saved_at FROM saved_posts sp
JOIN users u ON sp.user_id = u.user_id JOIN posts p ON sp.post_id = p.post_id WHERE sp.user_id = 1;

-- This query retrieves all stories posted by the user with user_id 1.
SELECT s.story_id, u.username, s.image_url, s.video_url, s.caption, s.created_at, s.expires_at FROM stories s
JOIN users u ON s.user_id = u.user_id WHERE s.user_id = 1;

-- This query retrieves all notifications received by the user with user_id 1.
SELECT n.notification_id, u.username AS notified_user, n.notification_type, ru.username AS related_user, n.created_at
FROM notifications n JOIN users u ON n.user_id = u.user_id LEFT JOIN users ru
ON n.related_user_id = ru.user_id WHERE n.user_id = 1;

-- This query retrieves all groups created by the user with user_id 1.
SELECT gd.group_id, gd.group_name, gd.group_description, u.username AS created_by, gd.created_at
FROM group_details gd JOIN users u ON gd.created_by = u.user_id WHERE gd.created_by = 1;