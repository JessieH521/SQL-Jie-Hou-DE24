-- a) Create a database file called hemnet.duckdb and ingest the data from the csv file into your database.

-- b) Make a wildcard selection to checkout the data,  * 通配符选择 wildcard selection
SELECT * from main.hemnet_data limit 5;

-- testing percentage_difference
SELECT 6950000*0.07;
-- 486500.00
SELECT 6590000 - 6950000*0.07;
-- Percentage Difference= (Final Price−Asked Price) /Asked Price ×100


-- c) Find out how many rows there are in the table
select COUNT(*) as total_rows from main.hemnet_data; 

-- d) Describe the table that you have ingested to see the columns and data types.
DESCRIBE main.hemnet_data;

desc;
desc table main.hemnet_data ;

-- e) Find out the 5 most expensive homes sold.

SELECT * from main.hemnet_data order by final_price desc limit 5;

SELECT
	address,
	commune,
	final_price
from
	main.hemnet_data
order by
	final_price desc
limit 5;


-- f) Find out the 5 cheapest homes sold.

SELECT * from main.hemnet_data order by final_price asc limit 5;

SELECT
	address,
	commune,
	area,
	rooms,
	final_price
from
	main.hemnet_data
order by
	final_price
limit 5;

-- explore rooms

SELECT
	Rooms,
	area,
	final_price
from
	main.hemnet_data hd
WHERE
	rooms <= 3;


-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold.

SELECT 
	MIN(final_price) AS min_price,
	round(AVG(final_price)) AS mean_price,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY final_price) AS median_price,
	MAX(final_price) AS max_price
FROM 
	main.hemnet_data;

SELECT 
	MIN(final_price) AS min_price,
	round(AVG(final_price)) AS mean_price,
	median(final_price) AS median_price,
	MAX(final_price) AS max_price
FROM 
	main.hemnet_data;


-- h) Find out statistics on minimum, mean, median and maximum prices of price per area.

SELECT 
	MIN(price_per_area) AS min_price_area,
	round(AVG(price_per_area)) AS mean_price_area,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY price_per_area) AS median_price_area,
	MAX(price_per_area) AS max_price_area
FROM 
	main.hemnet_data;


-- i) How many unique communes are represented in the dataset.
SELECT COUNT(DISTINCT commune) from main.hemnet_data;  


-- j) How many percentage of homes cost more than 10 million?
-- (delen/hela)*100
-- antagande 1 rad  -> 1 hem

SELECT
    (SELECT COUNT(*) FROM main.hemnet_data WHERE final_price > 10000000) * 100.0 / COUNT(*) AS percentage
FROM
    main.hemnet_data;
   

  
 -- percent_over_10000000 
   
SELECT COUNT(*) FROM main.hemnet_data;   -- 500
   
 SELECT
	COUNT(*)/500*100 as percent_over_10m 
FROM
	main.hemnet_data
WHERE
	final_price > 10000000;  
   

-- k) Feel free to explore anything else you find interesting in this dataset.



























