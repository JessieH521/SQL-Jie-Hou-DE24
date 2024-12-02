
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


-- 能看的等级， 比如 nc-17 17以上家长陪同

SELECT DISTINCT rating from main.film;


-- film_actor 表: actor_id ans film_id

SELECT * FROM main.film_actor;

desc table main.film_actor;


-- actor: actor_id

SELECT * FROM main.actor;


-- category: category_id

SELECT * FROM main.category;

-- film_category: film_id category_id
SELECT * FROM main.film_category;


-- customer

SELECT * FROM main.customer c ;

SELECT
	'customer' as type,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'D%';

SELECT * FROM main.store s ;

SELECT
	store_id,
	COUNT(*) as number_customer
from
	main.customer c
group by
	store_id 
ORDER BY  store_id ASC;


-- more EDAs 





























