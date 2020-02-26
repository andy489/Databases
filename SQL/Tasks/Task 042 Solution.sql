/*
MySQL & Oracle & MS SQL Server & DB2
*/
SELECT cast(sqrt(power(min(LAT_N)-max(LAT_N),2)
                   +power(min(LONG_W)-max(LONG_W),2)) as decimal (10,4))
FROM STATION;

/*
MySQL & Oracle
*/
SELECT round(sqrt(power(min(LAT_N)-max(LAT_N),2)
                   +power(min(LONG_W)-max(LONG_W),2)),4)
FROM STATION;
