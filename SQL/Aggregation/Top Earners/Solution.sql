-- github.com/andy489

-- MS SQL Server, MySQL, Oracle, DB2
SELECT (SALARY * MONTHS) as earn, count(*) 
FROM Employee
WHERE SALARY * MONTHS = (SELECT max(months*salary) 
                       FROM Employee)
GROUP BY earn;

-- MySQL
SELECT (SALARY * MONTHS), count(*) 
FROM EMPLOYEE group by 1 order by 1 desc limit 1;

-- OR

SELECT (SALARY * MONTHS) as earn, count(*) 
FROM EMPLOYEE group by earn order by earn desc limit 1;
