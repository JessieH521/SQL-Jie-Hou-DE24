SELECT * FROM main.employees e ;

-- 1. Write a query to display the names (first_name, last_name) using alias name "First Name", "Last Name"

SELECT
	FIRST_NAME as 'First Name',
	LAST_NAME  as 'Last Name'
FROM
	main.employees e ;

-- 2. Write a query to get unique department ID from employee table.

SELECT DISTINCT DEPARTMENT_ID FROM main.employees e ;


-- 3. Write a query to get all employee details from the employee table order by first name, descending.

SELECT * FROM main.employees order by FIRST_NAME DESC ;

-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).

SELECT FIRST_NAME, LAST_NAME, SALARY, SALARY * 15/100 as PF FROM main.employees e ;

-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME,SALARY FROM main.employees order by SALARY ;

-- 6. Write a query to get the total salaries payable to employees.

SELECT SUM(SALARY) as total_salary FROM main.employees e ;

-- 7. Write a query to get the maximum and minimum salary from employees table.

SELECT max(SALARY), MIN(SALARY) as total_salary FROM main.employees e ;

-- 8. Write a query to get the average salary and number of employees in the employees table.

SELECT AVG(SALARY) avg_salary, COUNT(EMPLOYEE_ID) total_employee FROM main.employees e ;

-- 9. Write a query to get the number of employees working with the company.

SELECT COUNT(*) from main.employees e; 

-- 10. Write a query to get the number of jobs available in the employees table.

SELECT COUNT(DISTINCT JOB_ID) FROM main.employees e ;

-- 11. Write a query get all first name from employees table in upper case.

SELECT UPPER(FIRST_NAME) FROM main.employees e ;

-- 12. Write a query to get the first 3 characters of first name from employees table.

SELECT FIRST_NAME[:3] FROM main.employees e ;

SELECT SUBSTRING(first_name, 1, 3) FROM employees;

-- 13. Write a query to calculate 171*214+625.

SELECT 171*214+625 as amount;

-- 14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.

SELECT FIRST_NAME ||' '|| LAST_NAME as name FROM main.employees e ;

SELECT concat(FIRST_NAME, ' ', LAST_NAME) FROM main.employees e ;

-- 15. Write a query to get first name from employees table after removing white spaces from both side.

SELECT TRIM(FIRST_NAME) from main.employees e; 

-- 16. Write a query to get the length of the employee names (first_name, last_name) from employees table.

SELECT LENGTH(FIRST_NAME || LAST_NAME) length_name FROM main.employees e ;

SELECT FIRST_NAME, LAST_NAME, LENGTH(FIRST_NAME) + LENGTH(LAST_NAME) as length_name FROM main.employees e ;

-- 17. Write a query to check if the first_name fields of the employees table contains numbers.

SELECT * FROM main.employees e WHERE regexp_matches(FIRST_NAME, '\d');

-- 18. Write a query to select first 10 records from a table.

SELECT * FROM main.employees e limit 10;

-- 19. Write a query to get monthly salary (round 2 decimal places) of each and every employee 四舍五入到小数点后 2 位
-- Note : Assume the salary field provides the 'annual salary' information.

SELECT EMPLOYEE_ID, FIRST_NAME, round(SALARY/12, 2) month_salary FROM main.employees e ;






















