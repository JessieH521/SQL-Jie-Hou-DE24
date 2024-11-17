-- case      和 if/else 很像， 改变的是查询结果，原表值并未改变。如果想改变，需要再 update。
-- 	  when...then...
-- 	  when...then...
-- end as 别名

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


-- update 修改原表的值
UPDATE
	main.data_jobs
SET
	experience_level = case
		when experience_level = 'SE' THEN 'Senior'
		when experience_level = 'MI' THEN 'Mid level'
		when experience_level = 'EN' THEN 'Entry level'
		when experience_level = 'EX' THEN 'Expert'
	end;

SELECT * from main.data_jobs dj ;

SELECT DISTINCT experience_level from main.dat a_jobs dj ;


















