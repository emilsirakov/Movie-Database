--1 What is the data structure? What information do we have available for movies?

-- Display the (whole) movies table.

TABLE movies;


--2 In the movies table there is a field called movieId. Sometimes we will not need this 
-- field for the analysis.

-- Display only title and genres of the first 10 entries from the movies table that is 
-- sorted alphabetically (starting from A) by the movie titles.

SELECT
	title,
	genres
FROM
	movies
ORDER BY
	title ASC
LIMIT 10;

--3 How many movies do we have the data for?

-- Display the total row count

SELECT
	count(title)
FROM
	movies;
-- 9,729

--4 Every movie has a genre assign to it. Maybe you have noticed that some of the movies 
-- has a few different genres assigned to them. Let’s pick one of the genres - e.g. drama 
-- - and check how many movies we have that were classified as this genre only.
--TABLE movies 

SELECT
	count(title)
FROM
	movies
WHERE
	genres = 'Drama';
-- 1,052
--WHERE genres LIKE 'Drama';
--WHERE genres LIKE '%Drama';

--5 Some of the movies are classified as a combination of a few genres. 
-- Check how many movies have drama as one of the assigned genres.

-- Display the count of drama movies that can also contain other genres.

-- Is this number different from the one in the previous question? Why do you think so?
SELECT
	count(title)
FROM
	movies
WHERE
	genres ILIKE '%drama%';
-- 4,359
-- Movies with genres Drama are 1,052, and the movies with the combined genres are 4,359


--6 What is the count of movies that are not classified as drama movies?

-- Display the count of movies don’t have drama (in any combination) as assigned genre

SELECT
	count(title)
FROM
	movies
WHERE
	genres NOT ILIKE '%drama%';
-- 5,370


SELECT count(title) FROM movies 
WHERE genres ILIKE '%action%'; -- there IS 1,827 ACTION movies

SELECT count(title) FROM movies 
WHERE genres = 'Action'; -- AND 60 pure ACTION movies

SELECT count(title) FROM movies 
WHERE genres ILIKE '%western%'; -- 167 western movies




--7 What is the year distribution of the movies? Do you have a favorite film? 
-- Which year is it from? How many movies from this year are visible in the movies dataset?

-- Display the count of movies that were released in 2003.

TABLE movies;
SELECT
	*
FROM
	movies
WHERE
	title = 'Jumanji ';
-- Jumanji is the movie, and it is from 1995.

SELECT
	count(title)
FROM
	movies
WHERE
	movie_year = 1995;
-- 259 movies are made in 1995


SELECT
	count(title)
FROM
	movies
WHERE
	movie_year = 2003;
-- The number of the movies released in 2003 is 279

--8 What is the year distribution of the movies? Do we have more movies from recent years? 
-- Do we have any movies from earlier years?
SELECT movie_year FROM movies; 


SELECT movie_year, count(title) FROM movies
GROUP BY movie_year;

SELECT count(title) FROM movies 
WHERE movie_year BETWEEN 2000 AND 2020;
-- 4780 movies are made between 2000 and 2020


-- Find all movies with a year lower 1910.
SELECT * FROM movies
WHERE movie_year < 1910;
-- There is only 3 movies before 1910



--9 Have you ever watched Star Wars? Or is there a different series of movies that you loved. 
-- Let’s see which of these movies are in the dataset.
SELECT
	*
FROM
	movies
WHERE
	title ILIKE '%Star Wars%';
-- There are 14 Star Wars movies in the dataset.

-- Retrieve all Star Wars movies from the movie table.
-- DELETE FROM movies WHERE title LIKE '%star wars%';
