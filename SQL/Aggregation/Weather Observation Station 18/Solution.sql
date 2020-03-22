-- github.com/andy489

-- MS SQL Server, MySQL, Oracle, DB2
SELECT cast(max(LAT_N)-min(LAT_N) + 
            max(LONG_W)-min(LONG_W) as decimal(10,4))
FROM STATION;
