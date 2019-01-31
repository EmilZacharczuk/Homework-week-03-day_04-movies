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
  -- fee INT4,
  id SERIAL4 PRIMARY KEY
);

-- INSERT INTO movies (title,genre,budget) VALUES ('Halloween','Horror', 1200000);
-- INSERT INTO movies (title,genre,budget) VALUES ('Black Panther','Action', 2400000);
-- INSERT INTO movies (title,genre,budget) VALUES ('Titanic','Drama', 3600000);
-- INSERT INTO movies (title,genre,budget) VALUES ('Apocalypse Now','Classic', 900000);
-- INSERT INTO movies (title,genre,budget) VALUES ('La La Land','Comedy', 2000000);
--
--
-- INSERT INTO stars (first_name,last_name) VALUES ('Jack','Nicholson');
-- INSERT INTO stars (first_name,last_name) VALUES ('Bette','Middler');
-- INSERT INTO stars (first_name,last_name) VALUES ('Leo','DiCaprio');
-- INSERT INTO stars (first_name,last_name) VALUES ('Tom','Jones');
-- INSERT INTO stars (first_name,last_name) VALUES ('Scarlett','Johansen');
