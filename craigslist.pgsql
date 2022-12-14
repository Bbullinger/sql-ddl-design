DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    area TEXT NOT NULL
);

CREATE TABLE craigslist_user (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    user_password TEXT NOT NULL,
    pref_region INTEGER REFERENCES  regions
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    category INTEGER REFERENCES categories,
    title TEXT NOT NULL,
    post TEXT DEFAULT 'No description',
    user_id INTEGER REFERENCES craigslist_user,
    region INTEGER REFERENCES regions
);



INSERT INTO regions (area)
VALUES
('East Nassau'),('Troy'),('Hudson');

INSERT INTO craigslist_user (username,user_password,pref_region)
VALUES
('Bbullinger','123',1),
('Slycat','321',3),
('Mutefish','dinosaur',2);

INSERT INTO categories (category)
VALUES
('Selling'),('Buying'),('Trading');

INSERT INTO post (category,title,post,user_id,region)
VALUES
(1,'Bike for sale','Only $150!',1,3),
(2,'Looking for bike','Under  $150 only',2,1),
(3,'Want to tell puns','For free',3,2);