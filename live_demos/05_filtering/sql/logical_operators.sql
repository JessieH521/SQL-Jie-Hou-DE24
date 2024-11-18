-- python 50000 < x < 100000
-- many other languages (x >50000) & (x < 100000)

-- in SQL - between ... and  operator

SELECT
	*
FROM
	main.data_jobs
WHERE
	salary_in_usd BETWEEN 200000 AND 500000;


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


SELECT
	job_title,
	experience_level,
	salary_in_usd
from
	main.data_jobs dj
where
	salary_in_usd BETWEEN 10000 and 500000
	AND job_title = 'Data Engineer'
	AND experience_level = 'Entry level';


-- between...and statement 
SELECT
	job_title,
	experience_level,
	round(10.68 * salary_in_usd/ 12) as salary_sek_month
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










