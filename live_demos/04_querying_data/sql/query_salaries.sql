desc;

SELECT * from data_jobs;  

-- data_jobs; 下面有红线，显示找不到，其实是 namespace的问题 ,可以这样写 main.data_jobs; 

SELECT * from main.data_jobs;  -- 首选

SELECT * from salaries.main.data_jobs;



-- limit clause
SELECT * from main.data_jobs limit 5;

SELECT
	work_year,
	job_title,
	salary_in_usd,
	company_location
from
	main.data_jobs;


-- exclude 全选 除了某些列
SELECT
	* exclude(salary,
	work_year)
from
	main.data_jobs;


-- unique, DISTINCT 去重 计算不重复的数据 看员工 类型：4种
SELECT DISTINCT employment_type from main.data_jobs;

SELECT DISTINCT experience_level from main.data_jobs;




