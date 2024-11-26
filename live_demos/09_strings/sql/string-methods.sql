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
	'SQL word' as type,
	sql_word,
	sql_word[0],     -- nothing
	sql_word[1],     -- first leter
	sql_word [-1]    -- last letter
FROM
	staging.sql_glossary sg ;


-- concatenation 并联
-- substr('fun', 1, 1)   取fun 的第一次字母取 长度为1 

SELECT UPPER(substr('fun', 1, 1)) || ' ej ' || UPPER('de24');

SELECT
	'SQL command: ' || sql_word,
FROM
	staging.sql_glossary sg ;


-- nested function 嵌套函数

SELECT
	sql_word,
	UPPER(TRIM(sql_word)) as sql_word
from
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






