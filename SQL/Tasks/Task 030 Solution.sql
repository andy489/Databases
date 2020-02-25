/*
mySQL & Oracle & MS SQL Server & DB2
*/
SELECT months*salary, count(*) 
FROM Employee
WHERE months*salary = (SELECT max(months*salary) 
                  FROM Employee)
GROUP BY months*salary;


/*
MySQL
*/
SELECT (SALARY * MONTHS) AS EARNINGS, count(*) 
FROM EMPLOYEE group by 1 order by EARNINGS desc limit 1;
