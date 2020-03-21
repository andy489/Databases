-- github.com/andy489

-- MySQL, Oracle, MS SQL Server, DB2
SELECT DISTINCT CITY FROM STATION 
WHERE lower(CITY) like 'a%'
      or lower(CITY) like 'e%'
      or lower(CITY) like 'i%'
      or lower(CITY) like 'o%'
      or lower(CITY) like 'u%';
      
-- MySQL, Oracle, DB2      
SELECT DISTINCT CITY FROM STATION
WHERE substr(lower(CITY),1,1) 
      in ('a','e','i','o','u');
      
-- MySQL
SELECT DISTINCT CITY FROM STATION 
WHERE CITY regexp "^[aeiou].*";

--  Pattern   | What the pattern matches
---------------------------------------
--    ^       |  Beginning of string
--  [...]     |  Any character listed between the square brackets

-- Useful Reference: https://www.tutorialspoint.com/mysql/mysql-regexps.htm
