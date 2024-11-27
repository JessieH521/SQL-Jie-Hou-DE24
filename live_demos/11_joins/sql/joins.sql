SELECT * FROM main.plants p ;


SELECT * FROM main.plant_care pc ;


-- left join

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


-- inner join 


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













