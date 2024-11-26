-- create new cleand table in new schema refined.sql_glossary.

CREATE schema if not exists refined;


CREATE table if not exists refined.sql_glossary as (
	SELECT
		UPPER(TRIM(sql_word)) as sql_word,
		regexp_replace(trim(description),' +', ' ', 'g') as description,
		example
	FROM
		staging.sql_glossary);


SELECT * from refined.sql_glossary;






