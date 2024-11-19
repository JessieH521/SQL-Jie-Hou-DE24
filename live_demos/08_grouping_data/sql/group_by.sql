SELECT * FROM main.cleaned_food cf ;

SELECT
	food,
	SUM(number_searches) as total_searches 
from
	main.cleaned_food cf
group by
	food
ORDER BY 
	total_searches DESC 
LIMIT 10;


SELECT
	year,
	SUM(number_searches) as total_searches 
from
	main.cleaned_food cf
group by
	year
ORDER BY 
	total_searches DESC 
LIMIT 10;


SELECT DISTINCT year from main.cleaned_food cf ;

SELECT
	year,
	SUM(number_searches) as total_searches 
from
	main.cleaned_food cf
group by
	year
HAVING 
	total_searches > 300000
ORDER BY 
	total_searches DESC 
;




















