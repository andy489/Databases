-- github.com/andy489

-- MS SQL Server
SELECT DISTINCT CITY FROM STATION 
WHERE CITY not like "%[aeiou]";
-- WHERE lower(CITY) not like "%[aeiou]";

-- MySQL
SELECT DISTINCT CITY FROM STATION
WHERE CITY regexp '[^aeiou]$';
-- WHERE lower(CITY) regexp '[^aeiou]$';

-- Oracle
SELECT DISTINCT CITY FROM STATION
WHERE regexp_like (CITY,'[^aeiou]$');
-- WHERE regexp_like(lower(CITY),'[^aeiou]$');
