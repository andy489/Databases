/*
MySQL
*/
SELECT CITY
FROM STATION
WHERE CITY regexp "^[aeiou].*";

/*
Oracle & MySQL
*/
SELECT CITY
FROM STATION
WHERE lower(CITY) like 'a%'
      or lower(CITY) like 'e%'
      or lower(CITY) like 'i%'
      or lower(CITY) like 'o%'
      or lower(CITY) like 'u%';
