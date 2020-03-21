-- github.com/andy489

-- MS SQL Server
select CONVERT(INT,CEILING(AVG(CONVERT(FLOAT,SALARY)) - 
AVG(CONVERT(FLOAT,REPLACE(CONVERT(VARCHAR,SALARY),"0",""))))) FROM Employees;

-- MS SQL Server, DB2
SELECT CAST(CEILING(AVG(CAST(Salary as Float))-AVG(CAST(REPLACE(CAST(Salary AS VARCHAR(10)),'0','') AS FLOAT))) AS INT)
FROM Employees;


-- MySQL, Oracle
SELECT ceil(avg(SALARY)-avg(replace(SALARY,'0','')))  FROM Employees;

-- OR

SELECT round(avg(SALARY)-avg(replace(SALARY,'0',''))+0.5) FROM Employees;
