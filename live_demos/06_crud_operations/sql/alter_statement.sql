-- 表添加一列，learnt：新增列的名称；BOOLEAN：新增列的数据类型 布尔 默认否。

-- DDL

-- add

alter table database.duckdb add column learnt boolean default false;

alter table database.duckdb add ’le‘ varchar;

-- DROP COLUMN

ALTER TABLE table_name DROP COLUMN column_name;

-- RENAME COLUMN 

ALTER TABLE table_name RENAME COLUMN old_column_name TO new_column_name;


SELECT * FROM database.duckdb;





















