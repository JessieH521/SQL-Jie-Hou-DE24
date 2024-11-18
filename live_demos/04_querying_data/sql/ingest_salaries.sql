create table if not exists data_jobs as (
    select * from read_csv_auto('data/salaries.csv')
);


-- 读取数据建表3中方法

-- 方法1: 在dbeaver 中运行上面代码，直接创建表。


-- 方法2: 在下面 terminal 中，输入 

--  duckdb data/salaries.duckdb 
--  D:  .read sql/ingest_salaries.sql;   读文件建表
--  select * from data_jobs;
-- control + D 退出库


-- 方法3: 在下面 terminal 中， 输入

-- duckdb data/salaries.duckdb < sql/ingest_salaries.sql

-- 表示将文件 sql 文件夹中 ingest_salaries.sql 中的 SQL 命令加载并运行。
-- <：在命令行中表示输入重定向，将指定文件的内容作为输入提供给 DuckDB。
-- 读取 ingest_salaries.sql 中的 SQL 命令，脚本文件中包含要执行的 SQL 语句（例如：创建表、插入数据、查询数据等）

-- duckdb data/salaries.duckdb  进入库中可以查看 是否建表成功
-- desc;
-- control + D 退出库












