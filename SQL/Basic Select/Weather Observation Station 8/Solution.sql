-- github.com/andy489

-- MySQL, MS SQL Server
SELECT DISTINCT CITY FROM STATION 
WHERE left(city,1) in ('a','e','i','o','u') 
and right(city, 1) in ('a','e','i','o','u')

-- MySQL
SELECT DISTINCT CITY FROM STATION
WHERE lower(CITY) regexp '^[aeiou].*[aeiou]$';

-- Oracle
SELECT DISTINCT CITY FROM STATION
WHERE regexp_like(lower(CITY),'^[aeiou].*[aeiou]$');
