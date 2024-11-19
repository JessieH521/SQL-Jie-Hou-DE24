-- eda: exploratory data analysis 探索性数据分析

SELECT * from main.food f ;

SELECT DISTINCT id from main.food f ;

SELECT COUNT(DISTINCT id) from main.food f ;

SELECT COUNT(*) as number_rows from main.food f ;

desc main.food;

SELECT * from main.food WHERE week_id BETWEEN '2004-04' and '2004-06';


-- do more EDA to understand the dateset














