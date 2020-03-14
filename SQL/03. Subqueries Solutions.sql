--MOVIES
--1
select name
from moviestar
where gender ='F' and name in (select name
			       from movieexec
			       where networth > 10000000);

--2
select name
from moviestar
where name not in (select name 
		   from movieexec)
order by name;

--3
select title
from movie
where length > (select length
		from movie
		where title = 'Star Wars')
order by title;

--4
--първи начин
select title, movieexec.name
from movie
join movieexec on movieexec."CERT#" = movie."PRODUCERC#"
where "PRODUCERC#" in (select "CERT#"
		       from movieexec
		       where networth > (select networth 
				         from movieexec
				 	 where name = 'Merv Griffin'))
order by title;

--втори начин
select movie.title, ex.name
from movie, (select "CERT#", name
             from movieexec
	     where networth > (select networth 
			       from movieexec
			       where name = 'Merv Griffin')) ex
where "PRODUCERC#" = "CERT#" order by title;

--PC
--1
select maker 
from product
where model in (select model
		from pc
		where speed > 500);

--2
select code, model, price
from printer
where price >= all(select price 
		   from printer);
			 
--3
select *
from laptop
where speed < all(select speed
		  from pc);

--4
select model, price 
from laptop 
where price >= all(select price from laptop 
				union select price from pc 
				union select price from printer)
				
union
select model, price 
from pc 
where price >= all(select price from laptop 
				union select price from pc 
				union select price from printer)
union
select model, price 
from printer 
where price >= all(select price from laptop 
				union select price from pc 
				union select price from printer);

--5
select maker	
from product	
where model in (select model
		from printer
		where color ='y'
		and price <= all(select price
				 from printer
				 where color = 'y'))

--6 
select maker 
from product 
where model in (select model 
		from (select * 
		      from pc 
		      where ram <= all(select ram from pc)) pc2 
		where speed >= all(select speed 
		from (select * 
		      from pc 
		      where ram <= all(select ram 
				       from pc)) pc3));

--SHIPS
--1
select distinct country
from classes
where numguns >=all(select numguns 
		    from classes);

--2
select distinct class 
from ships
where name in (	select ship
		from outcomes
		where result ='sunk');

--3
select name, class
from ships
where class in (select "class" 
		from classes
		where bore = '16')
order by name;

--4
select battle
from outcomes
where ship in (select name
		from ships
		where class = 'Kongo');

--5
select class, name
from ships
where class in (select "class"
		from classes c
		where numguns >= all(select numguns 
				     from classes
				     where bore = c.bore))
order by class;
