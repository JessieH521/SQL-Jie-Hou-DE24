-- 其实在这个练习里应该建2个表， 一个表只负责查询用的。 一个时cleaned 过的 的表 用于新建列的表。
-- 这样一个转用于写查询时的代码， 一个对表的结构可以更改
-- 以后记住，建2个表。 查询的时候很方便

SELECT * FROM main.cleaned_salaries cs ;

-- a) Transform employment type column based on this table

SELECT DISTINCT employment_type FROM main.cleaned_salaries;

SELECT 
	case employment_type
		when 'CT' then 'Contract'
		when 'FL' then 'Freelance'
		when 'PT' then 'Part time'
		when 'FT' then 'Full time'
		ELSE employment_type
	end as employment_type,
	* exclude(employment_type)
from 
	main.cleaned_salaries;


UPDATE 
	main.cleaned_salaries
SET 
	employment_type = case
		when employment_type = 'CT' then 'Contract'
		when employment_type = 'FL' then 'Freelance'
		when employment_type = 'PT' then 'Part time'
		when employment_type = 'FT' then 'Full time'
		ELSE employment_type  -- make it idempotent
	end;
	
SELECT * FROM main.cleaned_salaries cs ;


-- b) Do similar for company size, but you have to figure out what the abbreviations could stand for. Small, Medium,Large

SELECT DISTINCT company_size from main.cleaned_salaries cs ;

SELECT 
	CASE 
		when company_size = 'S' then 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		else company_size
	END as company_size,
	* exclude(company_size)
from main.cleaned_salaries cs ;
	

UPDATE 
	main.cleaned_salaries
SET 
	company_size = CASE 
		when company_size = 'S' then 'Small'
		WHEN company_size = 'M' THEN 'Medium'
		WHEN company_size = 'L' THEN 'Large'
		else company_size
	END;
	
SELECT * FROM main.cleaned_salaries cs ;


-- c) Make a salary column with Swedish currency for yearly salary.


-- 老师写的 查询时临时新列

-- one approach is to create a new table with this content
-- and replace the old one (create or replace table as ....)

SELECT
	salary_in_usd * 10.9 AS salary_sek_year,
	round(salary_in_usd*10.9/12) AS salary_sek_monthly,
	* 
FROM
	main.cleaned_salaries;

-- second approach --> add new cols

-- 我写的
-- 1. 先新添加列，空列
-- 2. insert 值进去

ALTER table main.cleaned_salaries add column swedish_currency bigint;

UPDATE 
	main.cleaned_salaries
SET 
	swedish_currency = salary_in_usd * 11;

-- 自己命名和老师不一样， 把列名改一下 alter table ... rename

alter table main.cleaned_salaries rename swedish_currency to salary_annual_sek;

desc main.cleaned_salaries;


-- d) Make a salary column with Swedish currency for monthly salary.

ALTER table main.cleaned_salaries add column swedish_currency_monthly bigint;

UPDATE main.cleaned_salaries SET swedish_currency_monthly = salary_in_usd * 11/12;

-- 自己命名和老师不一样， 把列名改一下 alter table... rename

alter table main.cleaned_salaries rename swedish_currency_monthly to salary_monthly_sek;



-- e) Make a salary_level column with the following categories: low, medium, high, insanely_high.
-- Decide your thresholds for each category. Make it base on the monthly salary in SEK.
 
-- 老师的 
-- strategy: statistical approach
-- there is aggregation function such as AVG, MIN, MAX, MEDIAN, QUANTILE_CONT
-- summarize in DuckDB
-- Summarize ：对变量进行汇总分析或总结，通常目的是提取这个变量的数据特征或关键信息。 q25， q50, q75....

summarize main.cleaned_salaries;

-- 93000 - low
-- 129000 - medium
-- 170000 - high
-- > 170000 - insanely high

-- 25th quantile -> 25% of dataset has lower than this value   

-- 方法1 查询时

SELECT
	salary_monthly_sek,
	CASE 
		WHEN salary_monthly_sek < 93000 THEN 'low'
		WHEN salary_monthly_sek < 129000 THEN 'Medium'
		WHEN salary_monthly_sek < 170000 THEN 'High'
		ELSE 'Insanely_high'
	END AS salary_level2 
FROM
	main.cleaned_salaries;


-- 我写的 新建列

ALTER table main.cleaned_salaries add column salary_level varchar;

SELECT salary_monthly_sek from main.cleaned_salaries cs order by salary_monthly_sek;

SELECT COUNT(*) from main.cleaned_salaries cs; 

UPDATE
	main.cleaned_salaries
SET
	salary_level = CASE 
		WHEN salary_monthly_sek < 100000 THEN 'low'
		WHEN salary_monthly_sek < 150000 THEN 'Medium'
		WHEN salary_monthly_sek < 300000 THEN 'High'
		-- WHEN salary_monthly_sek >= 300000 THEN 'Insanely_high'
		ELSE 'Insanely_high'
	END;
	
SELECT * from main.cleaned_salaries cs ;
SELECT salary_level, COUNT(*) from main.cleaned_salaries group by salary_level; 


-- f) Choose the following columns to include in your table: experience_level, employment_type, 
-- job_title, salary_annual_sek, salary_monthly_sek, remote_ratio, company_size, salary_level

desc main.cleaned_salaries;

-- 建表方式不对 ，删除了
CREATE table if not exists new_salaries(
experience_level varchar,
employment_type varchar,
job_title varchar,
salary_annual_sek bigint,
salary_monthly_sek bigint,
remote_ratio bigint,
company_size varchar,
salary_level varchar
);
DROP table new_salaries;

-- 正确的方式

CREATE table if not exists main.filter_salaries as
select
	experience_level,
	employment_type,
	job_title,
	salary_annual_sek,
	salary_monthly_sek,
	remote_ratio,
	company_size,
	salary_level
from
	main.cleaned_salaries;


-- 老师写的  CREATE OR replace table

CREATE OR replace TABLE main.cleaned_salaries AS (
select
	experience_level,
	employment_type,
	job_title,
	salary_annual_sek,
	salary_monthly_sek,
	remote_ratio,
	company_size,
	salary_level
from
	main.cleaned_salaries;
);

-- g) Think of other transformation that you want to do.



-- 1. CREATE OR REPLACE TABLE: 如果表已经存在，则会删除（替换）旧表并创建一个新表；如果表不存在，则直接创建。
-- 2. CREATE TABLE IF NOT EXISTS : 如果表已经存在，则不会执行任何操作；如果表不存在，则创建该表。





























