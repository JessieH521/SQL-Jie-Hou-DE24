
-- a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.

SELECT * from main.filter_salaries fs ;

SELECT COUNT(*) from main.filter_salaries WHERE job_title = 'Data Engineer'; 


-- b) Count number of unique job titles in total.

SELECT DISTINCT job_title from main.filter_salaries fs; 

SELECT COUNT(DISTINCT job_title) as number_job_title from main.filter_salaries fs; 


-- c) Find out how many jobs that goes into each salary level.

SELECT salary_level, count(DISTINCT job_title) as jobs from main.filter_salaries group by salary_level; 


-- d) Find out the median and mean salaries for each seniority levels.

SELECT
	salary_level,
	median(salary_monthly_sek) as median_salary,
	round(AVG(salary_monthly_sek)) as mean_salary
from
	main.filter_salaries
group by
	salary_level;


-- e) Find out the top earning job titles based on their median salaries and how much they earn.

SELECT
	salary_level,
	job_title,
	salary_monthly_sek
FROM
	main.filter_salaries
WHERE
	salary_level = 'Medium'
ORDER BY 
	salary_monthly_sek DESC 
LIMIT 1;


-- f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote. 远程办公

SELECT
	COUNT(*) as total_jobs, 
	COUNT(*) filter(WHERE remote_ratio = 0) as office_jobs,
	COUNT(*) filter(WHERE remote_ratio = 50) as half_jobs,
	COUNT(*) filter(WHERE remote_ratio = 100) as remote_jobs,
	round(office_jobs/total_jobs * 100, 2) as percentage_office_jobs,
	round(half_jobs/total_jobs * 100, 2) as percentage_half_jobs,
	round(remote_jobs/total_jobs * 100, 2) as percentage_remote_jobs
FROM
	main.filter_salaries;


-- g) Pick out a job title of interest and figure out if company size affects the salary. 
-- Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.

SELECT
	company_size, 
	round(AVG(salary_monthly_sek)) as mean_salary
from
	main.filter_salaries
WHERE 
	job_title = 'Data Engineer'
group by
	company_size;


-- h) Feel free to explore other things
































