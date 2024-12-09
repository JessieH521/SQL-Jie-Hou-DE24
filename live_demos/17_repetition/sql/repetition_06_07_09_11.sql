CREATE SCHEMA IF NOT EXISTS sql;

CREATE TABLE IF NOT EXISTS sql.lectures (
	study_week int primary key,     --primary key: only one
	content text,
	lecture text,
	studied boolean
);

CREATE TABLE IF NOT EXISTS sql.exercises (
	study_week int primary key,     
	exercise text,
	studied boolean
);

-- 放错位置了 不想在 sakila database 下建， 现在要删除这两个表所在的schema
-- delete sql schema； cascade: remove everything in it 删除里面含的所有
-- DROP schema sql cascade; 

desc;

INSERT
	INTO
	sql.lectures
values 
	(1, 'intro, query, ingest csv, CLI, dbeaver, table, select', '00-04', TRUE),
	(2, 'filtering, CRUD, conditionals, sorting, functions, grouping','05-08', TRUE),
    (
        3,
        'grouping, strings, regexp, set operations, performing joins, querying multiple tables',
        '09-11',
        FALSE
    ),
    (
        4,
        'window functions, CTEs, connect duckdb to Python, data security, SQL injection',
        '12-14',
        FALSE
    ),
    (
        5,
        'duckdb tips and tricks, repetition',
        '15-16',
        TRUE
    ),
    (6, 'exam', '17', FALSE);

INSERT INTO
    sql.exercises
VALUES
    (1, '0', TRUE),
    (2, '1', TRUE),
    (3, '2', TRUE),
    (4, '3', TRUE),
    (5, 'old exam', TRUE);

SELECT * FROM  sql.exercises e ;
SELECT * FROM sql.lectures l ;


-- studied week 4 and 6

SELECT * FROM sql.lectures WHERE study_week in (4,6);

UPDATE sql.lectures SET studied = TRUE WHERE study_week in (4, 6);

-- search with strings

SELECT * FROM sql.lectures WHERE content LIKE '%string%';

SELECT * FROM sql.lectures WHERE content LIKE '%python%';
SELECT * FROM sql.lectures WHERE lower(content) LIKE '%python%';


SELECT
	*
FROM
	sql.lectures l
left join sql.exercises e on
	l.study_week = e.study_week ;


SELECT
	*
FROM
	sql.lectures l
inner join sql.exercises e on
	l.study_week = e.study_week ;


SELECT
	l.study_week ,
	l.content,
	l.lecture,
	e.exercise 
FROM
	sql.lectures l
inner join sql.exercises e on
	l.study_week = e.study_week ;




