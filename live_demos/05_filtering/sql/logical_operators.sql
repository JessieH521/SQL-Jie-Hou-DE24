SELECT
	job_title,
	experience_level
from
	main.data_jobs dj;


-- 转换成瑞典克朗月薪

SELECT
	job_title,
	experience_level,
	(10.68 * salary_in_usd)/12 as salary_sek_month
from
	main.data_jobs dj;

-- and
SELECT
	job_title,
	experience_level,
	(10.68 * salary_in_usd)/ 12 as salary_sek_month
from
	main.data_jobs dj
where
	(salary_sek_month > 200000)
	and (salary_sek_month < 500000)
order BY
	salary_sek_month DESC;


-- between...and statement 
SELECT
	job_title,
	experience_level,
	(10.68 * salary_in_usd)/ 12 as salary_sek_month
from
	main.data_jobs dj
where
	salary_sek_month BETWEEN 200000 and 500000
order BY
	salary_sek_month DESC;

-- or operator
SELECT
	COUNT(*) 
from 
	main.data_jobs
WHERE 
	experience_level = 'Senior' 
	or experience_level = 'Expert';

-- not
SELECT
	COUNT(*) 
from 
	main.data_jobs
WHERE 
	not(experience_level = 'Senior' 
	or experience_level = 'Expert');










