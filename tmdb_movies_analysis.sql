SELECT *
FROM dbo.movies_imdb


-- 1. Exploratory Data Analysis
	-- 1.1. Budget, revenue and profit overview: 
	-- Total number of movies, budget and revenue:
	SELECT DISTINCT COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(budget) - SUM(revenue) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE()))
	
	-- Total number of movies, budget and revenue by released year
	SELECT YEAR(TRY_CONVERT(DATE, release_date)) as released_year,
			COUNT (DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE()))
	GROUP BY YEAR(TRY_CONVERT(DATE, release_date))
	ORDER BY YEAR(TRY_CONVERT(DATE, release_date))

	-- 1.2. Budget, revenue and profit by movies genres
	-- Overview: 
	SELECT genres,
			COUNT (DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE())) and (NOT genres = '0')
	GROUP BY genres
	HAVING SUM(budget) > 0
	-- ORDER BY COUNT (DISTINCT title) DESC
	ORDER BY SUM(revenue) - SUM(budget) DESC

	-- Number of animation movies: budget, revenue and profit (only count those with positive budgets)
	SELECT genres,
			COUNT (DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE())) AND (genres LIKE '%Animation%')
	GROUP BY genres
	HAVING SUM(budget) > 0
	ORDER BY COUNT (DISTINCT title) DESC

	-- Number of action movies: budget, revenue and profit (only count those with positive budgets)
	SELECT genres,
			COUNT (DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE())) AND (genres LIKE '%Action%')
	GROUP BY genres
	HAVING SUM(budget) > 0
	ORDER BY SUM(revenue) - SUM(budget) DESC

	-- Number of comedy movies: budget, revenue and profit (only count those with positive budgets)
	SELECT genres,
			COUNT (DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE())) AND (genres LIKE '%Comedy%')
	GROUP BY genres
	HAVING SUM(budget) > 0
	ORDER BY SUM(revenue) - SUM(budget) DESC

	-- Number of drama movies: budget, revenue and profit (only count those with positive budgets)
	SELECT genres,
			COUNT (DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE())) AND (genres LIKE '%Drama%')
	GROUP BY genres
	HAVING SUM(budget) > 0

	-- Number of documentaries: budget, revenue and profit (only count those with positive budgets)
	SELECT genres,
			COUNT (DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (status = 'Released') AND (YEAR(TRY_CONVERT(DATE,release_date)) <= YEAR(GETDATE())) AND (genres LIKE '%Documentary%')
	GROUP BY genres
	HAVING SUM(budget) > 0

	--1.3. Budget, revenue and profit by production countries:
	-- Total number of movies, budget and revenue by production countries:
	SELECT REPLACE(production_countries, 0, 'Others') AS production_countries,
			COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue, 
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	GROUP BY REPLACE(production_countries, 0, 'Others')
	ORDER BY SUM(revenue) - SUM(budget) DESC

	-- Total number of movies, budget and revenue from American producers:
	SELECT COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue, 
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE production_countries LIKE '%America%'

	-- Total number of movies, budget and revenue from French producers:
	SELECT COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue, 
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE production_countries LIKE '%French%'

	-- Total number of movies, budget and revenue from Indian producers:
	SELECT COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue, 
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE production_countries LIKE '%India%'

	-- Total number of movies, budget and revenue from Korean producers:
	SELECT COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue, 
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE production_countries LIKE '%Korea%'

	-- Total number of movies, budget and revenue from Japanese producers:
	SELECT COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue, 
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE production_countries LIKE '%Japan%'

	-- Total number of movies, budget and revenue from Vietnamese producers:
	SELECT COUNT(DISTINCT title) as number_of_movies,
			SUM(budget) as total_budget,
			SUM(revenue) as total_revenue, 
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE production_countries LIKE '%Vietnam%'

	-- 1.4. Popularity analysis:
	-- Most popular movie and its information:
	SELECT *
	FROM dbo.movies_imdb
	WHERE popularity = (SELECT MAX(popularity) FROM dbo.movies_imdb)

	-- Movie with highest rating from viewers:
	SELECT *
	FROM dbo.movies_imdb
	WHERE vote_avg = (SELECT MAX(vote_avg) FROM dbo.movies_imdb)

	-- Rating and popularity by movie genres:
	SELECT REPLACE(genres, 0, 'Others') AS genres,
		AVG(vote_avg) as avg_vote,
		SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	GROUP BY REPLACE(genres, 0, 'Others') 
	ORDER BY SUM(popularity) DESC

	-- Rating and popularity by production countries: 
	SELECT REPLACE(production_countries, 0, 'Others') AS production_countries,
		AVG(vote_avg) as avg_vote,
		SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	GROUP BY REPLACE(production_countries, 0, 'Others') 
	ORDER BY SUM(popularity) DESC

	-- Key contents of most well-known movies (exlude adult-rated film):
	SELECT top 10 title,
			genres,
			keywords,
			SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	WHERE adult = 'FALSE'
	GROUP BY title, keywords, genres
	ORDER BY SUM(popularity) DESC

	-- Key contents of the highest-rated movies (exlude adult-rated film):
	SELECT top 10 title,
			genres,
			keywords,
			AVG(vote_avg) as avg_vote
	FROM dbo.movies_imdb
	WHERE adult = 'FALSE'
	GROUP BY title, keywords, genres
	ORDER BY AVG(vote_avg) DESC

-- 2. Further analysis: American film
	-- 2.1. Overview: (America as the only production country)
	SELECT production_countries,
			AVG(vote_avg) as avg_vote,
			SUM(vote_count) as total_vote,
			SUM(revenue) as total_revenue,
			SUM(budget) as total_budget,
			SUM(revenue) - SUM(budget) as total_profit,
			SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	GROUP BY production_countries
	HAVING production_countries = 'United States of America'
	
	-- American movies with highest rating and their genres (exclude adult movies) (if rating is the same, the ones most voted appeared first):
	WITH temp AS(
	SELECT title,
			genres,
			DENSE_RANK() OVER (ORDER BY vote_avg DESC) as rating_rank,
			DENSE_RANK() OVER (ORDER BY vote_count DESC) as rating_count_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America') and (adult = 'FALSE')
	)
	SELECT TOP 10 * 
	FROM temp
	WHERE rating_rank = 1
	ORDER BY rating_count_rank

	-- Top 10 American movies with highest popularity and their genres (exclude adult movies):
	WITH temp AS(
	SELECT title,
			genres,
			popularity,
			DENSE_RANK() OVER (ORDER BY popularity DESC) as popularity_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America') and (adult = 'FALSE')
	)
	SELECT top 10 * 
	FROM temp
	ORDER BY popularity_rank

	-- Top 10 American movies with highest profit and their genres/contents (exclude adult films):
	WITH temp AS(
	SELECT title,
			genres,
			keywords,
			revenue - budget as profit,
			DENSE_RANK() OVER (ORDER BY revenue - budget DESC) as profit_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America') and (adult = 'FALSE')
	)
	SELECT TOP 10 *
	FROM temp
	ORDER BY profit_rank

	-- Top 5 most popular American movie producers: 
	SELECT top 5 production_companies,
			SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America')
	GROUP BY production_companies
	HAVING NOT production_companies = '0'  
	ORDER BY SUM(popularity) DESC

	-- Top 5 most profitable American movie producers: 
	SELECT top 5 production_companies,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America')
	GROUP BY production_companies
	HAVING NOT production_companies = '0'  
	ORDER BY SUM(revenue) - SUM(budget) DESC

	-- 2.2. Further analysis: American action films:
	-- Overview: Profit, ratings and popularity
	SELECT production_countries,
			AVG(vote_avg) as avg_vote,
			SUM(revenue) - SUM(budget) as total_profit,
			SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	WHERE genres LIKE '%Action%'
	GROUP BY production_countries
	HAVING production_countries = 'United States of America'

	-- The growth in number and profit of action movies over time (based on released date):
	SELECT YEAR(TRY_CONVERT(DATE, release_date)) as released_year,
			COUNT(DISTINCT title) as number_of_movies,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America') and (genres like '%Action%') and (YEAR(TRY_CONVERT(DATE, release_date)) IS NOT NULL) and (status = 'Released')
	GROUP BY YEAR(TRY_CONVERT(DATE, release_date))
	ORDER BY YEAR(TRY_CONVERT(DATE, release_date))

	-- Top 10 American action films with highest popularity:
	SELECT TOP 10 title,
			release_date,
			popularity,
			DENSE_RANK() OVER (ORDER BY popularity DESC) as popularity_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America') and (genres like '%Action%')
	ORDER BY DENSE_RANK() OVER (ORDER BY popularity DESC)

	-- Top 10 American action films with highest profit:
	SELECT TOP 10 title,
			release_date,
			revenue - budget as profit,
			DENSE_RANK() OVER (ORDER BY revenue - budget DESC) as profit_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'United States of America') and (genres like '%Action%')
	ORDER BY DENSE_RANK() OVER (ORDER BY revenue - budget DESC)

-- 3. Further analysis: Japanese film
	-- 3.1. Overview: (Japan as the only production country)
	SELECT production_countries,
			AVG(vote_avg) as avg_vote,
			SUM(vote_count) as total_vote,
			SUM(revenue) as total_revenue,
			SUM(budget) as total_budget,
			SUM(revenue) - SUM(budget) as total_profit,
			SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	GROUP BY production_countries
	HAVING production_countries = 'Japan'
	
	-- Japanese movies with highest rating and their genres (exclude adult movies) (if rating is the same, the ones most voted appeared first):
	WITH temp AS(
	SELECT title,
			genres,
			DENSE_RANK() OVER (ORDER BY vote_avg DESC) as rating_rank,
			DENSE_RANK() OVER (ORDER BY vote_count DESC) as rating_count_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (adult = 'FALSE')
	)
	SELECT TOP 10 * 
	FROM temp
	WHERE rating_rank = 1
	ORDER BY rating_count_rank

	-- Top 10 Japanese movies with highest popularity and their genres (exclude adult movies):
	WITH temp AS(
	SELECT title,
			genres,
			popularity,
			DENSE_RANK() OVER (ORDER BY popularity DESC) as popularity_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (adult = 'FALSE')
	)
	SELECT top 10 * 
	FROM temp
	ORDER BY popularity_rank

	-- Top 10 Japanese movies with highest profit and their genres/contents (exclude adult films):
	WITH temp AS(
	SELECT title,
			genres,
			keywords,
			revenue - budget as profit,
			DENSE_RANK() OVER (ORDER BY revenue - budget DESC) as profit_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (adult = 'FALSE')
	)
	SELECT TOP 10 *
	FROM temp
	ORDER BY profit_rank

	--3.2. Further analysis: Japanese animation film
	-- Overview: Profit, ratings and popularity
	SELECT production_countries,
			AVG(vote_avg) as avg_vote,
			SUM(revenue) - SUM(budget) as total_profit,
			SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	WHERE genres LIKE '%Animation%'
	GROUP BY production_countries
	HAVING production_countries = 'Japan'

	-- The growth in number and profit of animation movies over time (based on released date):
	SELECT YEAR(TRY_CONVERT(DATE, release_date)) as released_year,
			COUNT(DISTINCT title) as number_of_movies,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (genres like '%Animation%') and (YEAR(TRY_CONVERT(DATE, release_date)) IS NOT NULL) and (status = 'Released')
	GROUP BY YEAR(TRY_CONVERT(DATE, release_date))
	ORDER BY YEAR(TRY_CONVERT(DATE, release_date))

	-- Top 10 Japanese animation films with highest popularity:
	SELECT TOP 10 title,
			release_date,
			popularity,
			DENSE_RANK() OVER (ORDER BY popularity DESC) as popularity_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (genres like '%Animation%')
	ORDER BY DENSE_RANK() OVER (ORDER BY popularity DESC)

	-- Top 10 Japanese animation films with highest profit:
	SELECT TOP 10 title,
			release_date,
			revenue - budget as profit,
			DENSE_RANK() OVER (ORDER BY revenue - budget DESC) as profit_rank
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (genres like '%Animation%')
	ORDER BY DENSE_RANK() OVER (ORDER BY revenue - budget DESC)

	-- Top 5 most popular Japanese animation movie producers: 
	SELECT top 5 production_companies,
			SUM(popularity) as total_popularity
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (genres like '%Animation%')
	GROUP BY production_companies
	HAVING NOT production_companies = '0'  
	ORDER BY SUM(popularity) DESC

	-- Top 5 most profitable Japanese animation movie producers: 
	SELECT top 5 production_companies,
			SUM(revenue) - SUM(budget) as total_profit
	FROM dbo.movies_imdb
	WHERE (production_countries = 'Japan') and (genres like '%Animation%')
	GROUP BY production_companies
	HAVING NOT production_companies = '0'  
	ORDER BY SUM(revenue) - SUM(budget) DESC

	