-- github.com/andy489

-- MS SQL Server
DECLARE @var smallint = 1;

WHILE @var < 21
BEGIN
    SELECT REPLICATE('* ', @var);
    SET @var += 1;
END;

-- MySQL
SELECT REPEAT('* ', @NUMBER := @NUMBER + 1) 
FROM information_schema.tables, (SELECT @NUMBER:=0) t LIMIT 20;

-- Oracle
SELECT rpad('* ', (LEVEL)*2, '* ')
FROM dual
CONNECT BY LEVEL < 21;
