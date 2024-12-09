desc;

-- a) Describe all tables.

show tables;
desc;
SELECT * FROM information_schema.tables;

-- b) Select all data on all tables.

SELECT COUNT(*) from information_schema.tables;

SELECT * from main.actor;


-- c) Find out how many rows there are in each table.

SELECT COUNT(*) from main.actor;



-- The questions here might come from a business stakeholder which is not familiar with the table structure. 
-- Hence it's your job to find out which table(s) to look at.

-- d) Calculate descriptive statistics on film length.

SELECT * FROM main.film f ;
desc main.film;

SELECT length FROM main.film;
SELECT min(length) as min_length FROM main.film ;
SELECT MAX(length) as max_length FROM main.film ;
SELECT round(AVG(length), 2) as avg_length FROM main.film ;
SELECT median(length) as median_length FROM main.film;
SELECT SUM(length) as sum_length FROM main.film;
SELECT mode(length) as mode_length FROM main.film;   -- 出现频率最高的电影长度

-- e) What are the peak rental times?

SELECT * FROM main.rental r ;

SELECT rental_date FROM  main.rental r ;


SELECT	
	HOUR(rental_date) as rental_hour,
	COUNT(*) as times_rental
FROM
	main.rental
group by
	rental_hour
ORDER BY 
	times_rental DESC;

-- f) What is the distribution of film ratings?

/*
MPAA（美国电影协会） 的分级系统：
G（General Audiences）：适合所有观众，通常内容无暴力、粗俗语言等。
PG（Parental Guidance Suggested）：建议有家长指导，可能有轻微的暴力或敏感内容。
PG-13（Parents Strongly Cautioned）：建议家长对 13 岁以下儿童慎重决定是否观看，可能含有限制性内容。
R（Restricted）：限制级，17 岁以下观众需要成人陪同观看。
NC-17（Adults Only）：仅限成人，17 岁及以下观众禁止观看，内容可能涉及严重暴力或成人主题。
*/

SELECT
	rating,
	COUNT(rating) as num_rating
FROM
	main.film
group by
	rating
ORDER BY 
	num_rating desc;


-- g) Who are the top 10 customers by number of rentals?

SELECT * FROM main.rental r ;
SELECT * FROM main.customer c ;

-- 方法一

with customer_rental as (
SELECT
	customer_id,
	COUNT(*) as count_customer
FROM
	main.rental
group by
	customer_id
)
select
	c.customer_id,
	c.first_name,
	c.last_name,
	cr.count_customer
FROM
	customer_rental cr
join main.customer c on
	cr.customer_id = c.customer_id 
ORDER BY 
	count_customer DESC
LIMIT 10;

-- 方法二 from --join 要一起， 

SELECT
	r.customer_id,
	c.first_name,
	c.last_name,
	COUNT(*) as count_customer
FROM
	main.rental r
JOIN 
	main.customer c on 
	r.customer_id = c.customer_id
group by
	r.customer_id, c.first_name, c.last_name   -- first_name 和 last_name 也是非聚合列，所以必须包含在 GROUP BY 中，否则会导致语法错误。
ORDER BY 
	count_customer DESC
LIMIT 10;


-- h) Retrieve a list of all customers and what films they have rented.

--  需要连接4个表
 
SELECT * FROM main.customer c; -- customer_id -- first_name-- last_name
SELECT * FROM main.rental r ; -- rental_id -- inventory_id -- customer_id
SELECT * FROM main.inventory i ;   -- inventory_id -- film_id
SELECT * FROM main.film f ;   -- film_id -- title


SELECT
	c.first_name,
	c.last_name,
	f.title 
FROM
	main.customer c
join main.rental r on
	c.customer_id = r.customer_id 
JOIN main.inventory i on
	r.inventory_id = i.inventory_id 
JOIN main.film f on
	i.film_id = f.film_id ;


-- i) Make a more extensive EDA of your choice on the Sakila database.


select * from information_schema.tables;




















