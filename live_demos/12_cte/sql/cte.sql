desc;
SELECT * FROM main.payment p ;


-- top paying customers

with customer_payment as (
SELECT
	customer_id, sum(amount) as total_payment
FROM
	main.payment p
group by
	customer_id
)
SELECT
	*
FROM
	customer_payment
WHERE  total_payment > 150;



-- include name on customers -> join the customer table   -- having

with customer_payment as (
SELECT
	customer_id, sum(amount) as total_payment
FROM
	main.payment p
group by
	customer_id
HAVING  
	total_payment > 150
)
SELECT
	cp.customer_id,
	c.first_name,
	c.last_name,
	cp.total_payment	
FROM
	customer_payment cp
left join main.customer c on
	cp.customer_id = c.customer_id 
ORDER BY cp.total_payment DESC, c.last_name ASC;



-- list all films and their category
-- place joining inside of CTE block

with film_category as (
SELECT
	f.film_id,
	f.title as film_title,
	c.name as genre
FROM
	main.film f
inner join main.film_category fc on
	f.film_id = fc.film_id
INNER JOIN main.category c on
	c.category_id = fc.category_id
)
select
	*
FROM
	film_category
order by
	genre, film_title;
















