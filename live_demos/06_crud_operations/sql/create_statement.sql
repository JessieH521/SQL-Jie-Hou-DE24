-- 建一个 schema 叫 database 
CREATE schema if not exists database;

CREATE schema if not exists programming;

-- 查询所有 schema 信息
SELECT * from information_schema.schemata;

-- 创建一个名为 id_sql_sequence 的序列，序列的起始值为 1，2，3......自动递增的序列。

CREATE SEQUENCE IF NOT EXISTS id_sql_sequence START 1;

CREATE SEQUENCE IF NOT EXISTS id_python_sequence START 1;

CREATE SEQUENCE IF NOT EXISTS id_duckdb_sequence START 1;

-- pg_catalog 是 PostgreSQL 的系统模式(schema)，其中存储了系统的元数据表和视图。
-- 它包含有关数据库、表、列、索引、序列等的信息。
-- pg_sequences 是 PostgreSQL 中的一个系统视图，用于描述当前数据库中所有序列的信息。

SELECT * from pg_catalog.pg_sequences;


-- 建表

-- nextval('id_sql_sequence')：从 id_sql_sequenced 的序列中获取下一个值，并递增。id_sql_sequence 是一个已经创建的序列对象。
CREATE table if not exists database.sql(
	id integer default nextval('id_sql_sequence'),
	word string,
	description string
);

CREATE table if not exists database.duckdb(
	id integer default nextval('id_duckdb_sequence'),
	word string,
	description string
);

CREATE table if not exists programming.python(
	id integer default nextval('id_python_sequence'),
	word string,
	description string
);

SELECT * from information_schema.tables;


