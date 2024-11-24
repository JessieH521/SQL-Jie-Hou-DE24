SELECT * FROM staging.sql_glossary sg ;

-- array-like slicing

SELECT
	sql_word,
	sql_word[:2],
	sql_word[2:5]
FROM
	staging.sql_glossary sg ;


-- getitem []

SELECT
	sql_word,
	sql_word[0],     -- nothing
	sql_word[1],     -- first leter
	sql_word [-1]    -- last letter
FROM
	staging.sql_glossary sg ;

-- concatenation 并联

SELECT 'fun' || ' joke';

SELECT
	'SQL command: ' || sql_word,
FROM
	staging.sql_glossary sg ;

-- function: trim(). remove leading space and trailing space 去掉前后空格

SELECT
	TRIM(sql_word) as trimmed_word,
	trimmed_word[1],
	trimmed_word[-1]
from
	staging.sql_glossary;

-- function: upper(). transformation - upper case
-- nested function 嵌套函数

SELECT
	upper(TRIM(sql_word)) as trimmed_word,
	trimmed_word[1],
	trimmed_word[-1]
from
	staging.sql_glossary;


-- remove spaces between words

SELECT
	replace(TRIM(description), '  ', '')
from
	staging.sql_glossary;

SELECT
	description,
	replace(TRIM(description), '  ', ' ')
from
	staging.sql_glossary;






