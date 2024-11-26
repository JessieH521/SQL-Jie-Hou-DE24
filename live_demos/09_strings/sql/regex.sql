-- Regex: Regular Expression 正则表达式
-- regexp()

-- (' +',' '，'g'): 把超过1个空格的(2个或者2个以上) 变成 1个空格，g：global 应用到所有，不只是应用到第一个

SELECT
	regexp_replace(trim(description),
	' +',
	' ',
	'g'),
	LOWER(regexp_replace(trim(example),
	' +',
	' ',
	'g')),	
FROM
	staging.sql_glossary;



-- regexp_matches()
-- 是用来进行正则表达式匹配的函数，返回一个布尔值（是否匹配）。
-- 'select\b': 正则表达式模式，表示查找完整的单词 select。其中：select 表示单词。
-- \b 是正则表达式中的“单词右边界”，确保匹配的 select 是一个完整的单词，而不是部分单词（例如 selection就不可以， abcselect可以）。
-- '\bselect\b' 两边边界都有 独立的这个词
SELECT
	*
FROM
	staging.sql_glossary
WHERE
	regexp_matches(LOWER(description), 'select\b');



-- like: Pattern Matching 模式匹配操作符 

-- case sensitive 区分大小写。如果想都找可以用 LOWER（） 

-- 1. % （百分号）
-- 表示任意数量的字符（可以是 0 个、1 个或多个字符）,用于匹配大范围的字符串。
-- 'A%'：匹配以 A 开头的所有字符串，例如 Apple、A123、A.
-- '%B'：匹配以 B 结尾的所有字符串，例如 AB、123B。
-- '%middle%'：匹配包含 middle 的所有字符串，例如 middleman、in the middle,任意位置（可以在开头、中间或结尾）的记录。

-- 2. _ （下划线）

-- 表示单个字符, 用于匹配指定位置的单个字符。
-- 'A_'：匹配以 A 开头，后面跟一个字符的字符串，例如 AB、A1。
-- '_B'：匹配以 B 结尾，前面有一个字符的字符串，例如 AB、1B。


SELECT
	*
FROM
	staging.sql_glossary
WHERE
	LOWER(description) LIKE '%select%';





















