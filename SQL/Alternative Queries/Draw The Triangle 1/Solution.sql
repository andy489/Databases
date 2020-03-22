-- github.com/andy489

-- MS SQL Server
DECLARE @var smallint = 20;

WHILE @var > 0
BEGIN
    SELECT REPLICATE('* ', @var);
    SET @var -= 1;
END;

-- MySQL
SELECT REPEAT('* ', @NUMBER := @NUMBER - 1) 
FROM information_schema.tables, (SELECT @NUMBER:=21) t LIMIT 20;

-- Oracle
SELECT rpad('* ', (21-LEVEL)*2, '* ')
FROM dual
CONNECT BY LEVEL < 21;
