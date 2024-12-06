SELECT * FROM main.plants p ;


SELECT * FROM main.plant_care pc ;


-- left join
-- gets all from left table, with or without match in right table
-- without match -> nulls on rigth column

SELECT
	*
FROM
	main.plants p
left join 
main.plant_care pc on
	p.plant_id = pc.plant_id ;


SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
left join 
main.plant_care pc on
	p.plant_id = pc.plant_id ;



-- right join

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
right join 
main.plant_care pc on
	p.plant_id = pc.plant_id ;


-- inner join  == join  默认
-- gets same values on the join condition, intersecction, must exist in both tables

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
inner join 
main.plant_care pc on
	p.plant_id = pc.plant_id ;


-- full join
-- gets everything from bith tables, nulls where there is no match

SELECT
	p.plant_id,
	p.plant_name,
	p.type,
	pc.water_schedule,
	pc.sunlight 
FROM
	main.plants p
full join 
main.plant_care pc on
	p.plant_id = pc.plant_id ;













