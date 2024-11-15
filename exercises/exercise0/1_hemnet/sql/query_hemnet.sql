-- a) Create a database file called hemnet.duckdb and ingest the data from the csv file into your database.

-- b) Make a wildcard selection to checkout the data,  * 通配符选择 wildcard selection
SELECT * from main.hemnet_data limit 5;


-- c) Find out how many rows there are in the table
select COUNT(*) from main.hemnet_data; 

-- d) Describe the table that you have ingested to see the columns and data types.
DESCRIBE main.hemnet_data;

-- e) Find out the 5 most expensive homes sold.
SELECT * from main.hemnet_data order by final_price desc limit 5;

-- f) Find out the 5 cheapest homes sold.
SELECT * from main.hemnet_data order by final_price asc limit 5;

-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold.
SELECT 
	MIN(final_price) AS min_price,
	round(AVG(final_price)) AS mean_price,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY final_price) AS median_price,
	MAX(final_price) AS max_price
FROM 
	main.hemnet_data;

-- median(final_price) AS median_price


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

SELECT
    (SELECT COUNT(*) FROM main.hemnet_data WHERE final_price > 10000000) * 100.0 / COUNT(*) AS percentage
FROM
    main.hemnet_data;
   

-- k) Feel free to explore anything else you find interesting in this dataset.



























