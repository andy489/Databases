-- girhub.com/andy489

-- MS SQL Server, MySQL
SELECT DISTINCT CITY FROM STATION
WHERE (left(CITY,1) NOT IN ('a','e','i','o','u')
      AND right(CITY,1) NOT IN ('a','e','i','o','u'));

-- MySQL
SELECT DISTINCT CITY FROM STATION
WHERE lower(CITY) regexp '^[^aeiou].*[^aeiou]$';

-- Oracle
SELECT DISTINCT CITY FROM STATION
WHERE regexp_like(lower(CITY),'^[^aeiou].*[^aeiou]$');

-- MySQL, Oracle, DB2
select DISTINCT CITY FROM STATION 
WHERE lower(substr(CITY,1,1)) NOT IN ('a','e','i','o','u') 
AND lower(substr(CITY,LENGTH(CITY),1)) NOT IN ('a','e','i','o','u');
