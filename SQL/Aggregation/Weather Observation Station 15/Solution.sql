-- github.com/andy489

-- MS SQL Server, MySQL, Oracle
SELECT cast(LONG_W as decimal(10,4)) FROM STATION
WHERE LAT_N = (SELECT max(LAT_N)
               FROM STATION 
               WHERE LAT_N < 137.2345);
               
-- MySQL, Oracle
SELECT round(LONG_W,4) FROM STATION
WHERE LAT_N = (SELECT max(LAT_N)
               FROM STATION
               WHERE LAT_N < 137.2345);
               
-- MySQL
SELECT ROUND(LONG_W, 4)FROM STATION
WHERE LAT_N < 137.2345 ORDER BY LAT_N DESC LIMIT 1;      

-- DB2
SELECT cast(round(long_w,4) as decimal(10,4)) FROM STATION
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
FETCH first ROW ONLY;
