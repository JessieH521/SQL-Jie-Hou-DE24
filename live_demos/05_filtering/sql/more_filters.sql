-- in ,在 list 里选 in operator for list filtering
SELECT
	DISTINCT count(*)
from
	main.data_jobs dj
where
	company_size in ('M', 'S');


SELECT
	DISTINCT count(*)
from
	main.data_jobs dj
where
	company_size not in ('M', 'S');

-- filter clause

SELECT
	COUNT(*) as total_jobs,
	count(*) filter(WHERE remote_ratio = 100) as remote_jobs,
	round(remote_jobs/total_jobs * 100, 2) as percentage_remote_jobs
from
	main.data_jobs dj;

-- offset  跳过前6行
SELECT * from main.data_jobs dj offset 6;

SELECT * from main.data_jobs dj LIMIT 10 offset 5;     -- 第6到15条




























