-- DATA ENGINEERING:
--Creating empty tables to import data from pandas
-- 1. Create All Movies Table
CREATE TABLE all_movies(
    budget FLOAT NOT NULL,
    imdb_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    release_date VARCHAR,
    revenue FLOAT NOT NULL,
    production_companies VARCHAR NOT NULL,
	PRIMARY KEY (imdb_id)
);


-- 2. Create table with Oscar Nominated Movies
SELECT * FROM all_movies;

CREATE TABLE best_movies(
    release_year VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    production_companies VARCHAR NOT NULL,
    win VARCHAR NOT NULL, 
    imdb_id VARCHAR,
    release_date VARCHAR,
	FOREIGN KEY (imdb_id) REFERENCES all_movies(imdb_id)
);

-- 3. Create Table of Reviews/Ratings from 270,000 users
SELECT * FROM all_movies;

CREATE TABLE ratings(
    imdb_id VARCHAR,
    rating FLOAT NOT NULL,
    reviewer_id VARCHAR NOT NULL
);
