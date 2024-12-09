desc;

SELECT * FROM main.payment p limit 10;

SELECT
	customer_id,
	amount
from
	main.payment p ;


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


CREATE VIEW  IF NOT EXISTS main.payment_level as (
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
	COUNT(amount)  as number_per_level
FROM
	main.payment_level
group by
	cost_level
ORDER BY 
	number_per_level;






