-- github.com/andy489

-- MS SQL Server
SELECT DISTINCT CITY FROM STATION 
WHERE CITY not like "[aeiou]%";

-- MySQL
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[^aeiou]';

-- OR

SELECT DISTINCT CITY FROM STATION
WHERE lower(CITY) regexp '^[^aeiou]';

-- Oracle
SELECT DISTINCT CITY FROM STATION
WHERE regexp_like(lower(CITY),'^[^aeiou].*');
