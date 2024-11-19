SELECT
	*
from
	generate_series(date '2024-11-01',
	date '2024-11-30',
	interval '1 day') as t(november);


-- data dimension 数据维度

-- strftime(data_series,'%Y-%m-%d') 取其中日期部分的函数 年月日

SELECT
	strftime(data_series,'%Y-%m-%d') as date,
	month(data_series) as month,
	week(data_series) as week_number,
	weekday(data_series) as day_of_week        -- 0 is Sunday
from
	generate_series(date '2024-1-01',
	date '2024-12-31',
	interval '1 day') as t(data_series);     -- t表 data_series 列





























