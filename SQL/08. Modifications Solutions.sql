-- github.com/andy489

-- MOVIES

-- 1
insert into moviestar(name, birthdate) values('Nicole Kidman', 1967-20-06);

-- 2
delete from movieexec where networth < 30000000;

-- 3
delete from moviestar where address is null;

-- PC

-- 4
insert into product values('C', 1100, 'pc')
insert into pc values(12, 1100, 2400, 2048, 500, '52x', 299);

-- 5
delete from pc where model = 1100;

-- 6
delete from laptop 
where model in (select model from product 
				where type = 'laptop' and maker not in 
					(select maker from product
					 where type = 'printer'));
					 
-- 7 
update product set maker = 'A' where maker = 'B';

-- 8
update pc set price = price / 2, hd = hd + 20;

-- 9
update laptop set screen = screen + 1
where model in(select model from product	
			   where mker = 'B' and type = 'laptop');
			   
-- SHIPS
			  
-- 10
insert into classes values('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);
insert into ships values('Nelson', 'Nelson', 1927);
insert into ships values('Rodney', 'Nelson', 1927);

-- 11
delete from ships where name in(select ship from outcomes where result = 'sunk');

-- 12
update classes set bore = bore * 2.5, displacement = displacement / 1.1
