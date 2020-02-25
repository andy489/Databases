/*
My SQL & DB2 & MS SQL Server
*/
SELECT Name
FROM STUDENTS
WHERE Marks > 75 
      order by right(name,3), ID;

/*
My SQL & Oracle
*/
SELECT Name
FROM STUDENTS
WHERE Marks > 75 
      order by substr(name,-3), ID;
