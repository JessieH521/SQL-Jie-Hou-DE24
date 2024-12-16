-- synthetic 合成的
-- genarate 生成
-- unnest 不嵌套
-- concatenate 连接 合成
-- dice simulation  模拟骰子


-- generate_series(1, 100) :生成从1到100的序列， 包含1，100.  

SELECT generate_series(1, 100) as id;   -- 没展开

SELECT unnest(generate_series(1, 100)) as id;  -- 展开了


-- random() 从【0，1）的浮点数  random function

SELECT random(); 

SELECT * from generate_series(10);  -- 0-10

SELECT FLOOR(random() * 6) + 1 as dices from generate_series(10);


-- between 1 and 6, floor() 向下取整; random() * 6 -> [0,6)的小数
-- [1,6] 之间的整数

-- run 100 times, 随机生成1到6的数字100次
SELECT FLOOR(random() * 6) + 1 as dice from generate_series(1, 100);   

-- student synthetic
-- string operations 'student_'|| id, 两个合成一起

SELECT
	UNNEST(generate_series(1, 100)) AS id,
	'student_' || id AS student,
	round(random()*100) AS score;


SELECT
	id,
	'student_' || id AS student,
	score,
	CASE 
		WHEN score < 50 THEN 'F'
		WHEN score < 75 THEN 'G'
		ELSE 'VG'
	END AS grade
FROM
	(SELECT
		UNNEST(generate_series(1, 100)) AS id,
		round(random()*100) AS score
	);








