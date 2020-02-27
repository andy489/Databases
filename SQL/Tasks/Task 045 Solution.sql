/*
MS SQL Server
*/
SELECT Doctor, Professor, Singer, Actor
FROM (SELECT NAME, OCCUPATION, row_number() 
      over (partition by OCCUPATION order by NAME) as ro 
      FROM OCCUPATIONS) as x
pivot 
(min(NAME) for OCCUPATION in (Doctor, Professor, Singer, Actor)) as pvt;
         
