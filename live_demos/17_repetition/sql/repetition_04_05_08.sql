desc;

-- wildcard selection/ select star/ select all
-- return a result set of all columns and their respective rows
-- from the table/view: main.payment
-- when using main.payment we mean schema.table_name/view_name -> namespacing

-- limits the number
SELECT * FROM main.payment p limit 10;

-- without specifying the schema, duckdb will look at main schema by default

-- fully qualified name 
SELECT * FROM sakila.main.payment p ;


-- chooses which columns to return 
SELECT
	customer_id,
	amount
from
	main.payment p ;


-- exclude
SELECT * exclude(customer_id, amount) FROM main.payment p ;

-- aggregate function 'count' --> many_to_one mapping, 聚合函数 count --> 多对一映射

SELECT
	COUNT(*) as number_payments
FROM
	main.payment p ;

-- nexted functions 嵌套函数 round

SELECT
	MIN(amount) as min,
	round(AVG(amount), 3) as average,
	median(amount)as median,
	MAX(amount) as max
FROM
	main.payment p ;

-- filter 筛选
-- where filters the rows with a condition
-- if the condition is fulfilled - the row will be in the result set

SELECT
	*
FROM
	main.payment p
WHERE
	amount > 4.2
ORDER BY 
	amount DESC 
LIMIT  15;

-- case when ...  like if else
-- create a new column with amount classifications 

SELECT
	amount,
	CASE 
		when amount  < 3.5 then 'Low cost'
		when amount  < 7.5 then 'Medium cost'
		ELSE 'High cost'
	END as cost_level	
FROM
	main.payment p ;


SELECT
	*,
	CASE 
		when amount  < 3.5 then 'Low cost'
		when amount  < 7.5 then 'Medium cost'
		ELSE 'High cost'
	END as cost_level	
FROM
	main.payment p ;

-- view

CREATE VIEW IF NOT EXISTS main.payment_level as (
	SELECT
	*,
	CASE 
		when amount  < 3.5 then 'Low cost'
		when amount  < 7.5 then 'Medium cost'
		ELSE 'High cost'
	END as cost_level	
	FROM
	main.payment p
);

SELECT * FROM main.payment_level;

SELECT
	cost_level,
	COUNT(amount)  as number_per_level,
	round(AVG(amount), 2) AS mean_amount 
FROM
	main.payment_level
group by
	cost_level
ORDER BY 
	number_per_level;






