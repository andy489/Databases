-- github.com/andy489

-- MS SQL Server
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%[aeiou]';

-- Oracle
SELECT DISTINCT CITY FROM STATION 
WHERE regexp_like(CITY,'[aeiou]$');

-- MySQL, Oracle
SELECT DISTINCT CITY FROM STATION 
WHERE lower(substr(CITY,length(CITY),1))
      in ('a','e','i','o','u');

-- MySQL
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '[aeiou]$';

--  Pattern   | What the pattern matches
---------------------------------------
--    $       |  End of string
--  [...]     |  Any character listed between the square brackets

-- Useful Reference: https://www.tutorialspoint.com/mysql/mysql-regexps.htm

-- OR

SELECT DISTINCT CITY FROM STATION
WHERE substr(CITY,-1) 
      in ('a','e','o','i','u');
