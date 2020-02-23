/*
MySQL
*/

SELECT CITY,char_length(CITY) 
FROM STATION ORDER BY length(CITY) asc, CITY limit 1; 
SELECT CITY,char_length(CITY) 
FROM STATION ORDER BY length(CITY) desc, CITY limit 1;

/*
Oracle
*/

SELECT CITY, length(CITY)
FROM (SELECT CITY
      FROM STATION
      ORDER BY length(CITY) asc, CITY)
WHERE ROWNUM = 1;
SELECT CITY, length(CITY)
FROM (SELECT CITY
      FROM STATION
      ORDER BY length(CITY) desc, CITY)
WHERE ROWNUM = 1;
