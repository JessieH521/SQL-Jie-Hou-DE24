DROP table database.sql ;

-- 删除schema， 如果里面有东西，会提示错误。
DROP schema programming; 

-- 删除schema，不会提示错误，但会把里面但内容一起删除。
DROP schema programming cascade; 


SELECT * from information_schema.tables;


SELECT * from information_schema.schemata;


ALTER TABLE table_name DROP COLUMN column_name;


















