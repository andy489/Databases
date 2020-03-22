-- github.com/andy489

-- MS SQL Server, MySQL, Oracle
SELECT cast(min(LAT_N) as decimal(10,4)) FROM STATION
WHERE LAT_N > 38.7780;

-- MySQL, Oracle
SELECT round(MIN(LAT_N), 4) FROM STATION
WHERE LAT_N > 38.7780;

-- DB2
SELECT decimal(round(min(lat_n),4),10,4) FROM STATION 
WHERE LAT_N > 38.7780;
