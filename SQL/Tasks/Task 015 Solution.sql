/*
MySQL
*/
SELECT DISTINCT CITY
FROM STATION
WHERE lower(CITY) regexp '^[^aeiou].*');

/*
Oracle
*/
SELECT DISTINCT CITY
FROM STATION
WHERE regexp_like(lower(CITY),'^[^aeiou].*');
