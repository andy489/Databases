-- github.com/andy489

-- MS SQL Server
SELECT Doctor, Professor, Singer, Actor
FROM (SELECT NAME, OCCUPATION, row_number() 
      over (partition by OCCUPATION order by NAME) as ro 
      FROM OCCUPATIONS) as x
pivot 
(min(NAME) for OCCUPATION in (Doctor, Professor, Singer, Actor)) as pvt;

-- MySQL
SELECT MAX(C1), MAX(C2), MAX(C3), MAX(C4) FROM
(SELECT
COUNT(*) Rank,
IF (STRCMP(T1.Occupation, 'Doctor') = 0, T1.Name, NULL) AS C1,
IF (STRCMP(T1.Occupation, 'Professor') = 0, T1.Name, NULL) AS C2,
IF (STRCMP(T1.Occupation, 'Singer') = 0, T1.Name, NULL) AS C3,
IF (STRCMP(T1.Occupation, 'Actor ') = 0, T1.Name, NULL) AS C4
FROM Occupations T1 LEFT JOIN Occupations T2 ON T1.Occupation = T2.Occupation AND 
TRCMP(T1.Name, T2.Name) >= 0 GROUP BY T1.Name, T1.Occupation ORDER BY Rank, T1.Name) AS MyOccupations GROUP BY Rank;

-- Oracle
select *
from (
    select d, p, s, a
    from (
        select Name, Occupation, row_number() over (
            partition by Occupation
            order by Name
        )
        from Occupations
    )
    pivot (
        max(Name)
        for Occupation in ('Doctor' as d, 'Professor' as p, 'Singer' as s, 'Actor' as a)
    )
)
order by d, p, s, a;

-- Oracle, DB2
select  coalesce(doc.name,'NULL'),coalesce(prof.name,'NULL'),coalesce(sing.name,'NULL'),coalesce(act.name,'NULL')
from 
( select row_number() over(order by name) r , name from OCCUPATIONS where occupation = 'Doctor' ) doc 
full outer join 
( select row_number() over(order by name) r , name from OCCUPATIONS where occupation = 'Professor' ) prof on doc.r = prof.r 
full outer join 
( select row_number() over(order by name) r , name  from OCCUPATIONS where occupation = 'Singer' ) sing on sing.r = prof.r 
full outer join 
( select row_number() over(order by name) r , name  from OCCUPATIONS where occupation = 'Actor' ) act on sing.r = act.r 
order by doc.r,prof.r;       
