-- github.com/andy489

-- MS SQL Server
SELECT concat(Name,'(',Substring(Occupation,1,1),')') as Name
FROM occupations
Order by Name
SELECT concat('There are a total of',' ',count(occupation),' ',lower(occupation),'s.') as total
FROM occupations
group by occupation
order by total

-- OR
SELECT Name + '(' + Left(Occupation,1) +')' 
FROM Occupations
Order by Name

SELECT 'There are a total of '  + Convert(Varchar(10),Count(1)) + ' '  + Lower(Occupation) +'s.'
FROM Occupations
Group by Occupation
Order By Count(1)

-- Oracle, DB2
SELECT o.name || '(' || substr(o.occupation, 1, 1) || ')' output
FROM   occupations o
union all
SELECT 'There are a total of ' || count(*) || ' ' || lower(o.occupation) || 's.' output
FROM   occupations o
group by o.occupation
order by 1;
