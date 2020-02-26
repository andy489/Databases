/*
MySQL & Oracle & MS SQL Server
*/
SELECT cast(LONG_W as decimal(10,4))
FROM STATION
WHERE LAT_N = (SELECT max(LAT_N)
               FROM STATION 
               WHERE LAT_N < 137.2345);
               
/*
MySQL & Oracle
*/
SELECT round(LONG_W,4)
FROM STATION
WHERE LAT_N = (SELECT max(LAT_N)
               FROM STATION
               WHERE LAT_N < 137.2345);
               
