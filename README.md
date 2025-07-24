# SQL_EDA_TMDB_movies
## Objectives:  
- Practice EDA on large dataset using SQL
## The dataset:  
- The TMDb (The Movie Database) is a comprehensive movie database that provides information about movies, including details like titles, ratings, release dates, revenue, genres, and much more.  
- This dataset contains a collection of 1,000,000 movies from the TMDB database.
- Link to dataset: https://www.kaggle.com/datasets/asaniczka/tmdb-movies-dataset-2023-930k-movies/data
## Data Loading & Processing:
- Dataset downloaded from website, cleaned using Excel functions.
- Dataset bulk inserted from pre-created table in SQL.
- During queries, some data manipulation techniques may be applied (convert string to date/time to extract year, merge null data into "Others" group, filter null data,...)
## Key findings from the data:  
### 1. Overview: number of movies and profitability:
- From XVIII to XX centuries, the number of movies and profitability increased significantly.
- Documentary is the genres with highest number of movies; Comedy movies gain most in terms of profitability.
- USA is the countries with highest movies profitability, followed by China and Japan.
### 2. Overview: Popularity analysis:
- In general, Drama, Documentary and Comedy are the most popular genres.
- The most popular movie is "Blue Beetle", an Action - Scifi - Adventure film produced in the USA by Warner Bros and DC.
- The USA, Japan and the UK are countries where most popular films were produced.
### 3. Further analysis: American films:
- Leading production countries in profitability and popularity.  
- 5 out of 10 most popular movies are Action movies (may combine with other genres).  
- Tiktok Rizz Party, Avengers: Endgame and Titanic are all-time most profitable American movies.
- 6 out of 10 highest rated movies with decent votes are Animation movies.
- Metro-Goldwyn-Mayer is the most popular American film producer, but the company made most profit is Marvel Studio. 
### 4. Further analysis: Japanese films:
- 9 out of 10 most profitable Japanese movies are Animation films, the most popular are Demon Slayer, Your Name and Pokemon, respectively.  
- 5 out of 10 most popular Japanese movies are Animation films.  
- One Piece Film Red is the most popular Japanese movie.  
#### __Animation films:__  
- The "Golden Era" was from 2010 - 2019 with more than 100 movies produced yearly and constant positive profit.  
- Toei Animation is the most popular Japanese animation movies producer, but the most profitable movies were those collaborated with multiple producers.  
