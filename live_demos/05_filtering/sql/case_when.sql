-- case      和 if/else 很像， 改变的是查询结果，原表值并未改变。如果想改变，需要再 update。
-- 	  when...then...
-- 	  when...then...
-- end as 别名


-- EN --> Entry level
-- MI --> Mid level
-- SE --> Senior
-- EX --> Expert


-- EXCLUDE (experience_level) 除了某列

SELECT
	case
		when experience_level = 'SE' THEN 'Senior'
		when experience_level = 'MI' THEN 'Mid level'
		when experience_level = 'EN' THEN 'Entry level'
		when experience_level = 'EX' THEN 'Expert'
	end as experience_level,
	* EXCLUDE (experience_level)    -- 去掉原 experience_level，保留新的
from
	main.data_jobs dj;


SELECT
	case experience_level
		when 'SE' THEN 'Senior'
		when 'MI' THEN 'Mid level'
		when 'EN' THEN 'Entry level'
		when 'EX' THEN 'Expert'
	end as experience_level,
	* EXCLUDE (experience_level)    -- 去掉原 experience_level，保留新的
from
	main.data_jobs dj;


-- update 修改原表的值 ...set
-- to persist changes in the table --> update it


-- else experience_level 是需要加的，如果不加，其他不是 se,mi,en,ex 的 experience_level 会变成null。
-- 如果不加 else experience_level ，可以 end 下面加 where experience_level in ('SE', 'MI', 'EN', 'EX'); 也是相同意思。


UPDATE
	main.data_jobs
SET
	experience_level = case
		when experience_level = 'SE' THEN 'Senior'
		when experience_level = 'MI' THEN 'Mid level'
		when experience_level = 'EN' THEN 'Entry level'
		when experience_level = 'EX' THEN 'Expert'
		else experience_level    -- preserve existing value if no match
	end
-- where 
--	  experience_level in ('SE', 'MI', 'EN', 'EX');

SELECT * from main.data_jobs dj ;

SELECT DISTINCT experience_level from main.data_jobs;


















