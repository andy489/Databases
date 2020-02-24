/*
My SQL
*/
SELECT DISTINCT(CITY) 
FROM STATION 
WHERE CITY regexp '[aeiou]$'; 

/*
Oracle
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE regexp_like(CITY,'[aeiou]$');

/*
My SQL
*/
SELECT DISTINCT CITY
FROM STATION
WHERE substr(CITY,-1) 
      in ('a','e','o','i','u');

/*
My SQL & Oracle
*/
SELECT DISTINCT CITY
FROM STATION 
WHERE lower(substr(CITY,length(CITY),1))
      in ('a','e','i','o','u');
