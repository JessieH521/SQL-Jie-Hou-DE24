-- create a constant value 常量

SELECT 42 as meaning_of_life;

SELECT 42;

-- values clause

values (1), (2), (3);

CREATE table if not exists people_records as (
SELECT
	*
from 
	(
values
	(1, 'Johan'),
	(2, 'Johanna'),
	(3, 'Mustafa')) as t(id, name));

desc;


-- t 是表名， id, name 是列名 column




