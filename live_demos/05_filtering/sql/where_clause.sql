SELECT * from main.data_jobs dj;      -- dj 是别名 


SELECT
	*
from
	main.data_jobs dj
WHERE
	salary_in_usd < 50000; 


SELECT
	COUNT(*)
from
	main.data_jobs dj
WHERE
	salary_in_usd < 50000; 

-- filtering salary_in_usd lower than 50k
SELECT
	COUNT(*) as job_lower_than_50k
from
	main.data_jobs dj
WHERE
	salary_in_usd < 50000; 


-- focus on experience_level
SELECT
	DISTINCT experience_level
from
	main.data_jobs dj;

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








