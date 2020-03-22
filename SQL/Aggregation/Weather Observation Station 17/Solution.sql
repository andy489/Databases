-- github.com/andy489

-- MS SQL Server, MySQL, Oracle
SELECT cast(LONG_W as decimal(10,4))
FROM STATION
WHERE LAT_N = (SELECT min(LAT_N)
               FROM STATION
               WHERE LAT_N > 38.7780);
               
-- MySQL
SELECT round(LONG_W,4) 
FROM STATION 
WHERE LAT_N > 38.7780 order by LAT_N limit 1;

-- DB2
SELECT cast(round(LONG_W,4) as decimal(10,4))
FROM STATION
WHERE LAT_N = (SELECT min(LAT_N)
               FROM STATION
               WHERE LAT_N > 38.7780);
