/*
MySQL & Oracle & MS SQL Server
*/
SELECT cast(min(LAT_N) as decimal(10,4))
FROM STATION
WHERE LAT_N > 38.7780;
