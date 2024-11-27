
-- EDA exploratory data analysis 探索性数据分析

desc;
-- name 是 table/view 的名称

-- film table

SELECT * FROM main.film;

desc table main.film;


SELECT
	COUNT(*) as number_movies,
	COUNT(DISTINCT title) as unique_number_movies 
FROM
	main.film;


SELECT * FROM main.film;

SELECT DISTINCT rating from main.film;


-- film_actor 表

SELECT * FROM main.film_actor;

desc table main.film_actor;

-- actor

SELECT * FROM main.actor;

-- category

SELECT * FROM main.category;

SELECT * FROM main.film_category;

-- customer

SELECT
	'customer' as type,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'D%';



































