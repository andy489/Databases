/*
MySQL & Oracle & MS SQL Server & DB2
*/
SELECT name
FROM employee
WHERE salary > 2000 
      and months < 10
      order by employee_id asc;
