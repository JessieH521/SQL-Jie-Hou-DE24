/*
  a) Create a schema called refined. This is the schema where you'll put the transformed data.

  b) Now transform and clean the data and place the cleaned table inside the refined schema.

  c) Practice filtering and searching for different keywords in different columns.
     Discuss with a friend why this could be useful in this case.
 */

SELECT * FROM staging.sql_glossary;

CREATE schema if not exists refined;


SELECT
	UPPER(trim(sql_word)) as sql_word ,
	regexp_replace(TRIM(description), ' +', ' ', 'g') || '.' as description ,
	UPPER(regexp_replace(lower(TRIM(example)), ' +', ' ', 'g')[1]) || 
	regexp_replace(lower(TRIM(example)), ' +', ' ', 'g')[2:]as example
FROM
	staging.sql_glossary;


-- SUBSTRING('hello', 2)  子字符串提取 -> ello 第2个以后第都取
-- SUBSTRING('hello', 2, 2)  子字符串提取 -> el 从第2个提取 提取2字母

CREATE table if not exists refined.sql_glossary as (
SELECT
	UPPER(trim(sql_word)) as sql_word ,
	regexp_replace(TRIM(description), ' +', ' ', 'g') || '.' as description,
	UPPER(regexp_replace(lower(TRIM(example)), ' +', ' ', 'g')[1]) || 
	SUBSTRING(regexp_replace(lower(TRIM(example)), ' +', ' ', 'g'), 2) as example
FROM
	staging.sql_glossary);

SELECT * FROM refined.sql_glossary;


SELECT
	*
FROM
	refined.sql_glossary
WHERE
	regexp_matches(LOWER(description), '\btable\b');


SELECT * from refined.sql_glossary WHERE LOWER(example) LIKE '%column1%';











