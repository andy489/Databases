/*
MS SQL Server
*/
SELECT DISTINCT CITY
FROM STATION
WHERE lower(CITY) NOT LIKE '%[a,e,i,o,u]'
           OR lower(CITY) NOT LIKE '[a,e,i,o,u]%';

/*
MySQL
*/
SELECT DISTINCT CITY
FROM STATION
WHERE lower(CITY) regexp '^[^aeiou].*|.*[^aeiou]$';

/*
Oracle
*/
SELECT DISTINCT CITY
FROM STATION
WHERE regexp_like(lower(CITY),'^[^aeiou].*|.*[^aeiou]$');
