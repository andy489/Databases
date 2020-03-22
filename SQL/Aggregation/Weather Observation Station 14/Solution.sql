-- github.com/andy489

-- MS SQL Server, MySQL, Oracle, DB2
SELECT cast(max(LAT_N) as decimal(10,4)) FROM STATION
WHERE LAT_N < 137.2345;

-- MySQL
SELECT truncate(MAX(LAT_N), 4) FROM STATION
WHERE LAT_N < 137.2345;
