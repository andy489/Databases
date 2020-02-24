/*
MySQL
*/
SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY regexp "^[aeiou].*";

/*
Oracle & MySQL & MS SLQ Server & DB2
*/
SELECT DISTINCT CITY 
FROM STATION 
WHERE lower(CITY) like 'a%'
      or lower(CITY) like 'e%'
      or lower(CITY) like 'i%'
      or lower(CITY) like 'o%'
      or lower(CITY) like 'u%';
      
/*
Oracle & MySQL & DB2
*/
SELECT DISTINCT CITY
FROM STATION
WHERE substr(lower(CITY),1,1) 
      in ('a','e','i','o','u');
