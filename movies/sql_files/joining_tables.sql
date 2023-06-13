-- 1 Using a JOIN display 5 movie titles with the lowest imdb ids

TABLE links;
TABLE movies;
SELECT movies.title  AS movie, links.imdbid AS imdbid
FROM movies 
FULL JOIN links 
ON movies.movieid = links.movieid
ORDER BY imdbid ASC 
LIMIT 5;

-- 2 Display the count of drama movies

DROP TABLE IF EXISTS genres;
CREATE TABLE genres AS (
    SELECT 
    	movieid,
    	regexp_split_to_table(genres, '\|') AS genre
    FROM movies
);

TABLE genres;

SELECT count(movieid)
FROM genres
WHERE genre = 'Drama'; -- 4,359


-- 3 Using a JOIN display all of the movie titles that have the tag fun
TABLE tags;

SELECT
	movies.title AS movie,
	tags.tag AS tags
FROM
	movies
JOIN tags 
ON
	movies.movieid = tags.movieid
WHERE
	tag = 'fun';


-- 4 Using a JOIN find out which movie title is the first without a tag

SELECT
	movies.title AS movie,
	tags.tag AS tag
FROM
	movies
LEFT JOIN tags 
ON
	movies.movieid = tags.movieid
WHERE
	tag IS NULL
LIMIT 1;

-- 5 Using a JOIN display the top 3 genres and their average rating

TABLE ratings;
TABLE genres;
SELECT genres.genre, avg(rating)
FROM genres
LEFT JOIN ratings
ON genres.movieid = ratings.movieid
GROUP BY genre 
LIMIT 3;


-- 6 Using a JOIN display the top 10 movie titles by the number of ratings

SELECT movies.title, count(rating)  
FROM movies
LEFT JOIN ratings 
ON movies.movieid = ratings.movieid  
GROUP BY movies.movieid
ORDER BY count(rating) DESC 
LIMIT 10;



-- 7 Using a JOIN display all of the Star Wars movies in order of average rating where the film 
--   was rated by at least 40 users

SELECT movies.title, avg(rating) AS avg_ratings, count(userid) AS count_userid
FROM movies
LEFT JOIN ratings 
ON movies.movieid = ratings.movieid 
WHERE title ILIKE '%star wars%'
GROUP BY movies.movieid 
HAVING count(user) >= 40;

-- 8 Create a derived table from one or more of the above queries

DROP TABLE IF EXISTS star_wars;
CREATE TABLE star_wars AS(
		SELECT movies.title, avg(rating) AS avg_ratings, count(userid) AS count_userid
		FROM movies
		LEFT JOIN ratings 
		ON movies.movieid = ratings.movieid 
		WHERE title ILIKE '%star wars%'
		GROUP BY movies.movieid 
		HAVING count(user) >= 40
);
TABLE star_wars;

DROP TABLE IF EXISTS tytle_by_number_of_rating;
CREATE TABLE tytle_by_number_of_rating as(
		SELECT movies.title, count(rating)  
		FROM movies
		LEFT JOIN ratings 
		ON movies.movieid = ratings.movieid  
		GROUP BY movies.movieid
		ORDER BY count(rating) DESC 
		LIMIT 10
);
TABLE tytle_by_number_of_rating;

