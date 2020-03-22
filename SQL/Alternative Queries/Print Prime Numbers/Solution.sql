-- github.com/andy489

--MS SQL Server
declare @test int = 3;
declare @i int;
declare @testP bit;
declare @rep varchar(1000);

set @rep='2';

while @test <= 1000
begin
	set @i=2;
	set @testP=1;
	while @i<=sqrt(@test)
	begin
		if @test%@i = 0
		begin
			set @testP=0;
		end
		set @i= @i+1;
	end
	if @testP=1
	begin
		set @rep=@rep + '&' + cast(@test as varchar(4))
	end
	set @test = @test + 1;
end

select @rep;

-- Oracle
SELECT listagg(r, '&') within group (order by r)
FROM (SELECT rownum+1 r FROM dual connect by rownum < 1000)
WHERE r=2 or 0 not in(SELECT mod(r,rownum+1) FROM dual
                      connect by rownum<sqrt(r));

-- MySQL
SET @num1 := 1, @num2:=1;
SELECT GROUP_CONCAT(D.num SEPARATOR '&')
FROM 
(SELECT N1.mynum AS num, COUNT(N2.mynum) AS num_divs
FROM 
(SELECT (@num1 := @num1+1) AS mynum
FROM information_schema.columns C1 JOIN information_schema.columns C2
LIMIT 999) N1
JOIN 
(SELECT (@num2 := @num2+1) AS mynum
FROM information_schema.columns C1 JOIN information_schema.columns C2
LIMIT 999) N2
ON N1.mynum >= N2.mynum AND MOD(N1.mynum, N2.mynum) = 0
GROUP BY N1.mynum
HAVING num_divs=1) D;
