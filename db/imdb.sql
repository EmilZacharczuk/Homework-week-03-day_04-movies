--Codeclan Week 03 Day 04
-- Pair Programming
-- IMDB Apllication
DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;

CREATE TABLE movies(
  title VARCHAR(255),
  genre VARCHAR(255),
  budget INT4,
  id SERIAL4 PRIMARY KEY
);

CREATE TABLE stars(
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  id SERIAL4 PRIMARY KEY
);

CREATE TABLE castings(
  movie_id INT4 REFERENCES movies(id) ON DELETE CASCADE,
  star_id INT4 REFERENCES stars(id) ON DELETE CASCADE,
  fee INT4,
  id SERIAL4 PRIMARY KEY
);
