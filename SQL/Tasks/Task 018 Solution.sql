/*
MySQL & MS SQL Server
*/
SELECT DISTINCT CITY
FROM STATION
WHERE (left(CITY,1) NOT IN ('a','e','i','o','u')
      AND right(CITY,1) NOT IN ('a','e','i','o','u'));

/*
MySQL
*/
SELECT DISTINCT CITY
FROM STATION
WHERE lower(CITY) regexp '^[^aeiou].*[^aeiou]$';

/*
Oracle
*
SELECT DISTINCT CITY
FROM STATION
WHERE regexp_like(lower(CITY),'^[^aeiou].*[^aeiou]$');
