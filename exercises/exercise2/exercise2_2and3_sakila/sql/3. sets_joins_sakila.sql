-- 3. Sets and joins on sakila
  

-- a) Retrieve a list of all customers and actors which last name starts with G.

-- union all  customer + actor

SELECT * FROM main.actor a ;

SELECT
	(SELECT 'Customer') as role,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.last_name LIKE 'G%'
union all
SELECT
	(SELECT 'Actor') as role,
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE
	a.last_name like 'G%';


-- b) How many customers and actors starts have the the letters 'ann' in there first names?

SELECT * FROM main.actor a ;

SELECT
	(SELECT 'Customer') as role,
	COUNT(*) 
FROM
	main.customer c
WHERE
	LOWER(c.first_name) LIKE 'ann%'
union all
SELECT
	(SELECT 'Actor'),
	COUNT(*) 
FROM
	main.actor a
WHERE
	lower(a.first_name) like 'ann%';



-- c) In which cities and countries do the customers live in?

SELECT
	name,
	city,
	country 
FROM
	main.customer_list cl ;

-- 第二种

-- DISTINCT，只保留唯一组合的 first_name、last_name、city 和 country 的行，这样你就不会得到重复的结果

-- Find cities and countries of customers
SELECT DISTINCT c.first_name, c.last_name, ci.city, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- d) In which cities and countries do the customers with initials JD live in?

SELECT
	c.first_name,
	c.last_name,
	c2.city,
	c3.country
FROM
	main.customer c
join main.address a on
	c.address_id = a.address_id 
JOIN main.city c2 on
	c2.city_id = a.city_id 
JOIN main.country c3 on
	c3.country_id = c2.country_id 
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'; 


-- e) Retrieve a list of all customers and what films they have rented.


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


-- f) What else cool information can you find out with this database using what you know about SQL.



























