DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region VARCHAR(100) NOT NULL
);


CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(150) NOT NULL,
    preferred_region INTEGER REFERENCES regions
);


CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category VARCHAR(150) NOT NULL
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    description TEXT,
    location VARCHAR(150) NOT NULL,
    posting_region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories,
    user_id INTEGER REFERENCES users
);
