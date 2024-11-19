
-- do select before doing update, to make sure what we update

SELECT * FROM database.duckdb WHERE id IN (9, 1, 11);



UPDATE 
	database.duckdb 
SET 
	learnt = TRUE 
WHERE 
	id in (3, 6, 9);



SELECT * from database.duckdb d ;



