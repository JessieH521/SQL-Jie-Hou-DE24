
SELECT * FROM synthetic.sales_jan;

SELECT * FROM synthetic.sales_feb;


-- union  合并去重


-- 6 rows: 两个 Monitor sale_date 是不同的，所以6个行都是 unique
SELECT * FROM synthetic.sales_jan
union
SELECT * FROM synthetic.sales_feb;


-- 5 rows
SELECT id, product_name,  amount FROM synthetic.sales_jan
union
SELECT * exclude(sale_date) FROM synthetic.sales_feb;


-- union all 合并所有 不去重

-- 6 rows
SELECT id, product_name, amount FROM synthetic.sales_jan
union all
SELECT * exclude(sale_date) FROM synthetic.sales_feb;


-- intersect 交集

SELECT * FROM synthetic.sales_jan
intersect
SELECT * FROM synthetic.sales_feb;


SELECT product_name, amount FROM synthetic.sales_jan
intersect
SELECT product_name, amount FROM synthetic.sales_feb;


-- except A — B  A有但B没有的 A - AB重合的部分

SELECT product_name, amount FROM synthetic.sales_jan
except
SELECT product_name, amount FROM synthetic.sales_feb;
















