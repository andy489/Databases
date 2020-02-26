/*
MS SQL Server
*/
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
