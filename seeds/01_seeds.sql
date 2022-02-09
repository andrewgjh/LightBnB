INSERT INTO users (name, email, password)
VALUES ('Andrew', 'andrewgjun@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
('Alla', 'eremeevaalla@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
('Chris', 'chrislegge@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
('David', 'davidching@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
('John', 'johnlee@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
('Tim', 'timgalang@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' ),
('Kirk', 'kirk@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.' );


INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES (1,'Cottage', 'Best places to relax and get away from city life.', 'https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg','https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg',1000,5,2,4,'Canada','Relax Ln', 'Huntsville', 'Ontario', 'M28 4U8', true ),
(2,'Condo', 'Best places to relax and get away from city life.', 'https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg','https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg',800,1,2,3,'Canada','Relax Ln', 'Huntsville', 'Ontario', 'M28 4U8', true ),
(3,'Hut', 'Best places to relax and get away from city life.', 'https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg','https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg',220,4,4,5,'Canada','Relax Ln', 'Huntsville', 'Ontario', 'M28 4U8', true ),
(6,'Campground', 'Best places to relax and get away from city life.', 'https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg','https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg',180,1,1,0,'Canada','Relax Ln', 'Huntsville', 'Ontario', 'M28 4U8', true ),
(4,'Room Share', 'Best places to relax and get away from city life.', 'https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg','https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg',145,2,2,3,'Canada','Relax Ln', 'Huntsville', 'Ontario', 'M28 4U8', true ),
(1,'Rooftop', 'Best places to relax and get away from city life.', 'https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg','https://torontolife.com/wp-content/uploads/2021/05/cottage_wars_landing_sq-768x773.jpg',103,1,1,3,'Canada','Relax Ln', 'Huntsville', 'Ontario', 'M28 4U8', true );

INSERT INTO reservations (start_date, end_date, property_id, guest_id) 
VALUES 
('2012-01-03', '2012-02-03' ,1,2),
('2013-02-03', '2013-03-03' ,2,3),
('2014-04-03', '2014-06-03' ,3,2),
('2015-11-03', '2015-12-03' ,4,4),
('2016-03-07', '2016-04-03' ,3,1),
('2017-01-22', '2017-02-03' ,5,6),
('2018-09-23', '2018-10-22' ,5,2),
('2019-08-15', '2020-02-03' ,6,1),
('2020-01-03', '2020-03-05' ,3,2);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message) VALUES
(1,2,1,5,'the best'),
(2,3,2,1,'dont come back'),
(3,2,3,3,'im not impressed'),
(4,5,4,4,'could be better'),
(3,6,5,5,'the best'),
(4,1,6,5,'the best'),
(4,2,7,2,'shit'),
(5,5,8,5,'the best'),
(2,3,9,5,'the best');