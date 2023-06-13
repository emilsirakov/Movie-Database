drop table if exists movies;
create table movies(
    movieId int primary key,
    title varchar(255) not null,
    genres varchar(255),
    movie_year int
);

\copy movies from '05_databases/weekly_project/data_movies/movies.csv' delimiter ',' csv header;

drop table if exists tags;
create table tags(
    userId int,
    movieId int REFERENCES movies(movieId),
    tag varchar(255),
    timestamp int
);

\copy tags from '05_databases/weekly_project/data_movies/tags.csv' delimiter ',' csv header;

drop table if exists ratings;
create table ratings(
    userId int ,
    movieId int REFERENCES movies(movieId),
    rating numeric,
    timestamp int
);

\copy ratings from '05_databases/weekly_project/data_movies/ratings.csv' delimiter ',' csv header;

drop table if exists links;
create table links(
    movieId int REFERENCES movies(movieId),
    imdbId int,
    tmdbId int
);

\copy links from '05_databases/weekly_project/data_movies/links.csv' delimiter ',' csv header;