-- eda: exploratory data analysis 探索性数据分析


SELECT * from main.food f ;

SELECT DISTINCT id from main.food f ;

-- 201 food categories
SELECT COUNT(DISTINCT id) from main.food f ;

-- 135025 row total
SELECT COUNT(*) as number_rows from main.food f ;

-- cols: id, googleTopic, week_id, value
desc main.food;

-- testing filtering weeks
SELECT * from main.food WHERE week_id BETWEEN '2004-04' and '2004-10';


-- do more EDA to understand the dateset














