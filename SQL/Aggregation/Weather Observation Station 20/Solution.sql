-- github.com/andy489

-- MS SQL Server, MySQL, Oracle
SELECT cast(x.LAT_N as decimal (10,4)) 
FROM STATION x 
WHERE (SELECT count(LAT_N) 
       FROM STATION 
       WHERE LAT_N < x.LAT_N) = (SELECT count(LAT_N) 
                                  FROM STATION 
                                  WHERE LAT_N > x.LAT_N);
                                  
-- MS SQL Server
SELECT cast(avg(LAT_N) AS decimal(10,4))
FROM (SELECT LAT_N, 
      row_asc = row_number() OVER (order by LAT_N asc),
      row_desc = row_number() OVER (order by LAT_N desc)
      FROM STATION) as x
WHERE row_asc BETWEEN row_desc-1 AND row_desc+1;
