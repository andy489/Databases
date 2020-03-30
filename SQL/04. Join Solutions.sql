-- github.com/andy489

-- MOVIES
-- 1
select title, name
from movieexec join movie on "CERT#"="PRODUCERC#"
where "PRODUCERC#" = (select "PRODUCERC#" 
from movie 
where title = 'Star Wars')
order by title;

-- 2
select distinct movieexec.name
from movieexec inner join movie on "CERT#"="PRODUCERC#"
inner join starsin on movietitle = title
where starname = 'Harrison Ford'

-- 3
select distinct studioname, starname
from movie inner join starsin on title = movietitle
order by studioname;

-- 4
select starname, networth, title
from starsin inner join movie on movietitle = title 
inner join movieexec on "PRODUCERC#" = "CERT#"
where networth >= all(select networth from movieexec)
order by title, starname;

-- 5
select name, movietitle
from moviestar left join starsin on name = starname
where movietitle is null;

-- PC
-- 1
select maker, product.model, product.type 
from product left join laptop on product.model = laptop.model 
left join pc on product.model = pc.model 
left join printer on product.model = printer.model
where laptop.code is null and pc.code is null and printer.code is null;

-- 2
-- първи начин
select product.maker
from product inner join laptop on laptop.model = product.model
intersect 
select product.maker 
from product inner join printer on printer.model = product.model

-- втори начин
select distinct t1.maker 
from (select maker from product inner join laptop on laptop.model = product. model)t1
inner join (select maker from product inner join printer on printer.model = product.model)t2
on t1.maker = t2.maker

-- 3
select distinct t1.hd
from laptop t1
inner join laptop t2 on t1.hd = t2.hd 
where t1.model != t2.model;

-- 4
select pc.model 
from pc left join product on pc.model = product.model
where maker is null;

-- SHIPS
-- 1
select * from ships
inner join classes on classes.class = ships.class
order by name;

-- 2
select * from ships
right join classes on classes.class = ships.class
order by name;

-- 3
select classes.country, ships.name
from ships left join outcomes on ships.name = outcomes.ship
inner join classes on classes.class = ships.class  
where outcomes.ship is null
order by country;

-- 4
select ships.name as "Ship Name"
from ships inner join classes on ships.class = classes."class" 
where numguns >= 7 and launched = 1916
order by "Ship Name";

-- 5
select ship, battle, date
from outcomes inner join battles on battles.name = outcomes.battle 
where result = 'sunk'
order by battle;

-- 6
select name, displacement, launched
from classes inner join ships on ships.class = classes."class" 
where ships.name = ships.class
order by 1;

-- 7
select *
from classes left join ships on classes.class = ships.class
where ships.name is null;

-- 8
select ships.name, displacement, numguns, result
from classes inner join ships on classes.class = ships.class
inner join outcomes on ships.name = outcomes.ship 
where battle = 'North Atlantic'
order by 1;
