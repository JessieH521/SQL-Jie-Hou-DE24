DESC;

SELECT ALL COLUMN FROM main.actor a ;
SELECT COLUMNS FROM main.category c ;

-- film_id, title
SELECT * FROM main.film f ;

-- film_id, actor_id
SELECT * FROM main.film_actor fa ;

-- actor_id, first_name, last_name
SELECT * FROM main.actor a ;


-- Q: which actor play which film_id ?

SELECT
	a.first_name,
	a.last_name,
	fa.film_id 
FROM
	main.actor a
left join main.film_actor fa on
	a.actor_id = fa.actor_id ;


-- Q: which actor play which film title ? 2次 join

SELECT
	a.first_name,
	a.last_name,
	f.title AS film_title
FROM
	main.actor a
left join main.film_actor fa on
	a.actor_id = fa.actor_id 
LEFT JOIN main.film f on 
	f.film_id = fa.film_id ;


-- film and category  2次join

-- if doing LEFT JOIN get all films including those without a category -> the category becomes NULL
-- INNER JOIN - get all films with associated category

SELECT
	f.title,
	c.name as 'genre'
from
	main.film_category fc
join main.category c on
	fc.category_id = c.category_id 
JOIN main.film f on
	f.film_id  = fc.film_id ;

desc;

SELECT * FROM main.address a ;

SELECT * FROM main.city c ;

SELECT * FROM main.country cty ;

-- staff（all staffs, so use left join） address, city, country

SELECT
	s.first_name,
	s.last_name,
	a.address,
	c.city,
	cty.country 
FROM
	main.staff s
left join main.address a on
	s.address_id = a.address_id 
LEFT JOIN main.city c on
	a.city_id = c.city_id 
LEFT JOIN main.country cty on
	c.country_id = cty.country_id ;


















