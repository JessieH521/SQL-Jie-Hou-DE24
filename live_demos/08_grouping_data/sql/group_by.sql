
SELECT * FROM main.cleaned_food cf ;

SELECT * FROM main.cleaned_food2;

-- 10 most searched food
-- sum（）把列中的各行中的值相加

SELECT
	food,
	SUM(number_searches) as total_searches 
from
	main.cleaned_food cf
group by
	food
ORDER BY 
	total_searches DESC 
LIMIT 10;


-- total searches by year
SELECT
	year,
	SUM(number_searches) as total_searches 
from
	main.cleaned_food cf
group by
	year
ORDER BY 
	total_searches DESC 
LIMIT 10;


-- distinct
SELECT DISTINCT year from main.cleaned_food cf ;


-- having
SELECT
	year,
	SUM(number_searches) as total_searches 
from
	main.cleaned_food cf
group by
	year
HAVING 
	total_searches > 300000
ORDER BY 
	total_searches DESC ;

-- double group by
SELECT
	year,
	food,
	SUM(number_searches) as total_searches 
from
	main.cleaned_food cf
group by
	food,
	year
ORDER BY  total_searches DESC ;


-- left for reader

-- week 的类型是 varchar， 需转换成 int

DESC main.cleaned_food2;

-- 临时 查询的时候改了
SELECT CAST(week AS int) AS week_int FROM main.cleaned_food2; 

-- 原表直接更改 列的类型
ALTER TABLE main.cleaned_food2 ALTER week TYPE INT;  


-- most popular food in summer

SELECT
	food,
	sum(number_searches) AS total_searches
FROM
	main.cleaned_food2
WHERE 
	week BETWEEN 23 AND 35
GROUP BY
	food
ORDER BY
	total_searches DESC LIMIT 20;


-- most popular food in winter

SELECT
	food,
	SUM(number_searches) AS total_searches
FROM
	main.cleaned_food2
WHERE
	week IN (51, 52) OR week < 13
GROUP BY
	food
ORDER BY 
	total_searches;
















