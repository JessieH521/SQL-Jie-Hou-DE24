-- transformations 转换
-- slicing 切片

-- id -> food
-- remove googleTopic
-- year column
-- week_id -> week
-- value -> number_of_searches

SELECT * from main.food f ;

-- SUBSTRING(week, 1, 4) 从列 week 列的各值中，提取从第 1 个字符开始的 4 个字符 = week[:4]

CREATE table if not exists cleaned_food as(
SELECT
	id as food,
	week_id as week,
	SUBSTRING(week, 1, 4) as year,
	week[:4] AS year,
	value as number_searches
FROM
	main.food
);

CREATE table if not exists cleaned_food2 as(
SELECT
	id as food,
	week_id[6:] as week,
	SUBSTRING(week_id, 1, 4) as year,
	value as number_searches
FROM
	main.food
);

SELECT * from main.cleaned_food;

SELECT * from main.cleaned_food2;


desc;













