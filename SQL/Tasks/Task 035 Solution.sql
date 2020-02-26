/*
MySQL & Oracle & MS SQL Server
Using subquery
*/
SELECT cast(LONG_W as decimal(10,4))
FROM STATION
WHERE LAT_N = (SELECT min(LAT_N)
               FROM STATION
               WHERE LAT_N > 38.7780);
               
/*
MySQL
Using limit
*/
SELECT round(LONG_W,4) 
FROM STATION 
WHERE LAT_N > 38.7780 order by LAT_N limit 1;
