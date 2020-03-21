-- github.com/andy489

-- MS SQL Server, MySQL, DB2 
SELECT Name FROM STUDENTS
WHERE Marks > 75 
      order by right(Name,3), ID;

-- MySQL, Oracle
SELECT Name FROM STUDENTS
WHERE Marks > 75 
      order by substr(Name,-3), ID;
