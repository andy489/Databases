/* 
MS SQL Server
*/
SELECT x.CONTINENT, cast(avg(y.POPULATION) as decimal(10,0))
FROM CITY y INNER JOIN COUNTRY x
     ON y.COUNTRYCODE = x.CODE
        group by x.CONTINENT;
        
/*
MySQL & Oracle
*/
SELECT x.CONTINENT, round(avg(y.POPULATION) - 0.5)
FROM CITY y INNER JOIN COUNTRY x
     ON y.COUNTRYCODE = x.CODE
        group by x.CONTINENT;
