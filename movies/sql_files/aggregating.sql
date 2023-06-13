--1 How many ratings are available in the dataset?
TABLE ratings; 
-- Display the total row count of the ratings table.
SELECT count(*) FROM ratings;
-- Total row count - 100,818


--2 What is the distribution of genres combinations?

-- Display the total count of different genres combinations in the movies table.

SELECT genres, count(genres) FROM movies
GROUP BY genres;

--3 Have you already explored the tags table? What unique tags can you see for a selected movie?
TABLE tags;
-- Display unique tags for movie with id equal 60756. Use tags table.

SELECT DISTINCT tag FROM tags
WHERE movieid = 60756;


--4 How many movies from different years do we have in the dataset? Focus only on given time period.

-- Display the count of movies in the years 1990-2000 using the movies table. 
SELECT count(title) FROM movies 
WHERE movie_year BETWEEN 1990 AND 2000;
-- 2495 movies
-- Display year and movie_count.
SELECT movie_year, count(title) FROM movies
GROUP BY movie_year;

SELECT movie_year BETWEEN 1990 AND 2000, count(title) FROM movies
GROUP BY movie_year;


--5 Which year had the highest number of movies in the dataset?
--TABLE movies;

SELECT movie_year, count(title) FROM movies
GROUP BY movie_year
ORDER BY count(title)DESC
LIMIT 1;
-- Display the year where most of the movies u=in the database are from.


--6 One of the metrics that could be used to measure the popularity of the movies is the 
-- total count of ratings (the number of people who rated a movie). 
-- What are the most popular movies if we use this metric?
TABLE ratings;
SELECT movieid , count(rating) AS count_movie_ratings FROM ratings 
GROUP BY movieid  
ORDER BY count(rating) DESC;

-- Display 10 movies with the most ratings. Use ratings table. Display movieid, count_movie_ratings.
TABLE ratings;
SELECT movieid , count(rating) AS count_movie_ratings FROM ratings 
GROUP BY movieid  
ORDER BY count(rating) LIMIT 10;




--7 Another metric that we could use to measure the popularity of the movies is the average rating. 
-- However, to ensure the quality of this information we need to have at least a given 
-- number of ratings. What are the most popular movies using this metric?
TABLE ratings;

SELECT movieid, avg(rating) AS avg_rating , count(rating) FROM ratings 
GROUP BY movieid
HAVING count(rating) >= 50
ORDER BY avg_rating DESC;
-- Display the top 10 highest rated movies by average that have at least 50 ratings. 

-- Display the movieid, average rating and rating count. Use the ratings table.



--8 Imagine that you would like to continue focusing on the drama movies only. 
-- As you have multiple questions about drama movies you decided to create a view representing 
-- drama movies that you could reuse later on.

-- Create a view that is a table of only movies that contain drama as one of it’s genres. 

CREATE VIEW new_drama_view AS 
SELECT * 
FROM movies 
WHERE genres  = 'Drama';

-- Display the first 10 movies in the view.
SELECT * FROM new_drama_view LIMIT 10;
