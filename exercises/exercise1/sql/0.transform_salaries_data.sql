SELECT * FROM main.cleaned_salaries cs ;

-- a) Transform employment type column based on this table

SELECT 
	case employment_type
		when 'CT' then 'Contract'
		when 'FL' then 'Freelance'
		when 'PT' then 'Part time'
		when 'FT' then 'Full time'
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
		ELSE employment_type
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

ALTER table main.cleaned_salaries add column salary_level varchar;

SELECT swedish_currency_monthly from main.cleaned_salaries cs order by swedish_currency_monthly;
SELECT COUNT(*) from main.cleaned_salaries cs; 

UPDATE
	main.cleaned_salaries
SET
	salary_level = CASE 
		WHEN salary_monthly_sek < 100000 THEN 'low'
		WHEN salary_monthly_sek < 150000 THEN 'Medium'
		WHEN salary_monthly_sek < 300000 THEN 'High'
		WHEN salary_monthly_sek >= 300000 THEN 'Insanely_high'
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

-- g) Think of other transformation that you want to do.


































