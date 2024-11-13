SELECT
	MIN(salary_in_usd) as min_salary_usd, 
	round(AVG(salary_in_usd)) as mean_salary_usd,
	median(salary_in_usd) as median_salary_usd,
	max(salary_in_usd) as max_salary_usd 
from
	main.data_jobs;



-- round() 四舍五入

-- filter() 函数通常用于从集合中过滤元素











