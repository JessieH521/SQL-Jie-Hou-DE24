CREATE table if not exists course_info(
	content varchar primary key, 
	week integer, 
	content_type varchar
);



INSERT
	INTO
	main.course_info(
	content, week, content_type)
	
VALUES
('00_intro', 46, 'lecture'),
('01_course_structure', 46, 'lecture'),
('02_setup_duckdb', 46, 'lecture'),
('exercise_0', 46, 'exercise'),

('03_setup_dbeaver', 47, 'lecture'),
('04_querying_data', 47, 'lecture'),
('05_filtering', 47, 'lecture'),
('exercise_1', 47, 'exercise'),

('06_crud_operations', 48, 'lecture'),
('07_generating_data', 48, 'lecture'),
('08_grouping_data', 48, 'lecture'),
('exercise_2', 48, 'exercise'),

('09_strings', 49, 'lecture'),
('10_set_operations', 49, 'lecture'),
('11_joins', 49, 'lecture'),
('exercise_3', 49, 'exercise'),

('12_cte', 50, 'lecture'),
('13_macros', 50, 'lecture'),
('14_python_duckdb', 50, 'lecture'),
('exercise_4', 50, 'exercise'),

('tenta', 51, 'exam');



SELECT * FROM main.course_info;

















