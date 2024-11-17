SELECT * from main.data_jobs dj;      -- dj 是别名 

SELECT
	COUNT(*)
from
	main.data_jobs dj
WHERE
	salary_in_usd < 500000; 


SELECT
	COUNT(*) as job_lower_than_50k
from
	main.data_jobs dj
WHERE
	salary_in_usd < 50000; 


SELECT
	*
from
	main.data_jobs dj
WHERE
	experience_level = 'EN';


SELECT
	median(salary_in_usd) as median_salary_use
from
	main.data_jobs dj
WHERE
	experience_level = 'EN'; 

SELECT
	median(salary_in_usd) as median_salary_use
from
	main.data_jobs dj
WHERE
	experience_level = 'MI'; 








