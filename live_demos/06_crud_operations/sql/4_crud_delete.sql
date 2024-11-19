-- DML  Data Manipulation Language


SELECT * FROM database.duckdb WHERE  id IN (5, 8);

SELECT * FROM database.duckdb WHERE  word IN ('TIMESTAMPTZ', 'DROP SCHEMA');



SELECT
	*
from
	programming.python
where
	id = 2;


DELETE
FROM
	programming.python
WHERE
	id = 2;


SELECT * from database.duckdb d ;

SELECT * FROM database.duckdb d WHERE id > 10;

DELETE from database.duckdb WHERE id > 10;

















