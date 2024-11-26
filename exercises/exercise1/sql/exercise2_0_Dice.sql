-- 0. Dice rolls simulations


-- a) Generate 10 rows of dice rolls data

SELECT FLOOR(random()*6) + 1 AS dice FROM generate_series(9);



-- b) Calculate the average of getting a six

/*
 1. 生成数据：
使用 WITH dice_rolls 创建一个临时表，存储 10 次掷骰子的结果。
 2. 计算概率：
CASE WHEN dice_roll = 6 THEN 1.0 ELSE 0 END：如果掷出点数为 6，返回 1.0，否则返回 0。
AVG(...)：计算这些值的平均数，相当于 掷出 6 的次数 / 总次数。 = 1/6
 */

WITH dice_table AS (
SELECT
	FLOOR(random()* 6) + 1 AS dice_roll
FROM
	generate_series(1, 10))
SELECT
	AVG(CASE
		WHEN dice_roll = 6 THEN 1.0
		ELSE 0
	END
	) AS average_six
FROM
	dice_table;



-- c) Generate 100 rows of dice rolls and calculate average of getting a six

SELECT FLOOR(random()*6) + 1 AS dice FROM generate_series(1, 100);

WITH dice_table AS (
SELECT
	FLOOR(random()* 6) + 1 AS dice_roll
FROM
	generate_series(1, 100))
SELECT
	AVG(CASE
		WHEN dice_roll = 6 THEN 1.0
		ELSE 0
	END
	) AS average_six
FROM
	dice_table;

-- d) Repeat the experiment with 1000, 10000, 100000, 1000000 rolls.


WITH dice_table AS (
SELECT
	FLOOR(random()* 6) + 1 AS dice_roll
FROM
	generate_series(1, 100000))
SELECT
	AVG(CASE
		WHEN dice_roll = 6 THEN 1.0
		ELSE 0
	END
	) AS average_six
FROM
	dice_table;


-- e) What is the theoretical mean?

/*
理论上，掷骰子是一个均匀分布的随机事件，每一面被掷出的概率相同，即：
P(掷出6) = 掷出6的情况数/总情况数 = 1/6 ≈ 0.1667
理论值：16.67%。
实验结果：随着掷骰次数增加，实验的平均值会逐渐接近理论值。这是 大数定律 的体现。
 */

/*
 Theoretical mean for getting a 6 on a fair six-sided dice is:
 This means that, theoretically, 16.67% of all rolls should result in a 6.
 As the number of rolls increases, the empirical mean (calculated average)
 will converge to the theoretical mean, due to the Law of Large Numbers.
 */














