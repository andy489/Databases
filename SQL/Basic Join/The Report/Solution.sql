-- github.com/andy489

-- MS SQL Server, MySQL, Oracle, DB2
SELECT case when Grade < 8 then 'NULL' else Name end 
as PrintName, Grade, Marks
FROM Students INNER JOIN Grades ON (Marks between Min_Mark and Max_Mark)
order by Grade desc, Name asc;
