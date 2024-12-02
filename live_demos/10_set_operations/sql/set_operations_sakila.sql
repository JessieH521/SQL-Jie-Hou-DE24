-- want to combine customers and actors into one table

SELECT * FROM main.customer c ;
SELECT * FROM main.actor a ;

-- union

SELECT
	'Customer' as type,
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE
	c.first_name LIKE 'A%'
UNION 
SELECT
	'Actor',
	a.first_name,
	a.last_name
FROM
	main.actor a 
WHERE a.first_name LIKE 'A%';


-- intersect 交集

-- customer and actor same name

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
INTERSECT 
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a ;


-- union all 并集 不去重 5 rows JENNIFER	DAVIS 出现2次

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE 
	c.first_name LIKE 'J%' and c.last_name LIKE 'D%'
union ALL 
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE 
	a.first_name LIKE 'J%' and a.last_name LIKE 'D%';

-- union 并集去重 4 rows

SELECT
	c.first_name,
	c.last_name
FROM
	main.customer c
WHERE 
	c.first_name LIKE 'J%' and c.last_name LIKE 'D%'
union
SELECT
	a.first_name,
	a.last_name
FROM
	main.actor a
WHERE 
	a.first_name LIKE 'J%' and a.last_name LIKE 'D%';



-- except





















