-- github.com/andy489

-- PC
-- 1 
-- първи начин
select cast(avg(speed) as decimal(10,2)) from pc;

-- втори начин				  
select round(avg(speed),2) from pc

-- 2
-- първи стил
select p.maker, avg(l.screen) as AvgScreen
from laptop l join product p on l.model=p.model
group by p.maker
order by p.maker;

--втори стил
select maker,avg(screen) as AvgScreen
from laptop l join product p on l.model=p.model
group by 1
order by 1;

-- 3
select avg(speed)
from laptop
where price > 1000;

-- 4
select cast(avg(p.price) as decimal (10,2))
from pc p join product pr on pr.model = p.model
where pr.maker = 'A';

-- 5
select maker,avg(price) as AvgPrice
from (select model, price from pc union all select model, price from laptop) t1
join product on product.model = t1.model 
where maker='B' group by maker;

-- 6
select speed,avg(price) as AvgPrice
from pc 
group by speed
order by speed;

-- 7
select maker, count(pc.model) as number_of_pc
from product join pc on pc.model=product.model
group by maker having count(pc.model)>=3
order by maker;

-- 8
select product.maker, max(pc.price) as price
from product join pc on pc.model=product.model
group by product.maker
order by price desc limit 1

-- 9
select speed, avg(price) as AvgSpeed
from pc
group by speed 
having speed > 800;

-- 10
select maker, cast(avg(pc.hd)as decimal (10,2)) as AvgHdd
from pc join product on pc.model = product.model 
where maker in(select distinct maker 
			   from product join printer on printer.model = product.model) 
group by maker
order by maker;

-- SHIPS
-- 1
select count(distinct class) as no_classes
from classes
where type ='bb';

-- 2
select class, avg(numguns) as avgGuns
from classes
where type ='bb'
group by class
order by class;

-- 3
select floor(avg(numguns)) as avgGuns
from classes
where type = 'bb';

-- 4
select ships.class, min(launched) as FirstYear, max(launched) as SecondYear
from ships 
group by class
order by class;

-- 5
select s.class, count(*) as no_sunk
from outcomes o join ships s on o.ship = s.name
where o.result = 'sunk'
group by s.class;

-- 6
select class, count(*) as no_sunk
from outcomes o join ships s on o.ship = s.name
where o.result = 'sunk' and s.class in (select c.class
from classes c join ships s on c.class = s.class group by c.class having count(c.class)>=2)
group by s.class;

-- 7
select country, cast(avg(bore) as decimal(10,2)) as avgBore 
from classes c join ships s on c.class = s.class 
group by country
order by country;
