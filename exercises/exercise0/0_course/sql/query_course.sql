-- a) Select all the exercises in this course
select * from main.course_info where content_type = 'exercise';
 
 
-- b) Select all the lectures in this course
select * from main.course_info where content_type = 'lecture';


-- c) Select all records for week 48
select * from main.course_info where week = 48;


-- d) Select all records for week 47-49
select * from main.course_info where week in (47, 48, 49);

select * from main.course_info where week >= 47 and week <= 49;


-- e) How many lectures are in the table?
select count(*) as lecture_count from main.course_info where content_type = 'lecture';


-- f) How many other content are there?
select count(*) as lecture_count from main.course_info where content_type != 'lecture';


-- g) Which are the unique content types in this table?
select DISTINCT content_type as unique_content from main.course_info;


-- h) Delete the row with content 02_setup_duckdb and add it again.
DELETE from main.course_info where content = '02_setup_duckdb';
SELECT * from main.course_info;
INSERT INTO main.course_info values('02_setup_duckdb', 46, 'lecture');


-- i) You see that 02_setup_duckdb comes in the end of your table, even though the week is 46. 
-- Now make a query where you sort the weeks in ascending order.
SELECT * from main.course_info order by week, content_type DESC;


-- j) Now you can choose what you want to explore in this table.


































