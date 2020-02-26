/*
MySQL & oracle & MS SQL Server & DB2
*/
SELECT cast(max(LAT_N)-min(LAT_N) + 
            max(LONG_W)-min(LONG_W) as decimal(10,4))
FROM STATION;
