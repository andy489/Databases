--MOVIES

--1
--първи начин
select starname
from starsin
where starname in (select name 
		   from moviestar
	  	   where gender = 'M')
and movietitle = 'The Usual Suspects';					

--втори начин
select name
from moviestar 
where name in (select starname
	       from starsin 
	       where movietitle = 'The Usual Suspects')
and gender = 'M'

--трети начин
select distinct name
from starsin
join moviestar on name = starname 
where movietitle = 'The Usual Suspects'
	  and gender = 'M';

--четвърти начин
select name
from moviestar
where gender = 'M'
intersect 
select starname
from starsin
where movietitle = 'The Usual Suspects'

-пети начин						  
select starname 
from starsin, moviestar
where starsin.starname = moviestar.name 
      and moviestar.gender = 'M'
      and movietitle = 'The Usual Suspects';

--2
--първи начин
select starname
from starsin
where movietitle in (select title
		     from movie
		     where studioname = 'MGM')
and movieyear = '1995';

--втори начин
select starname
from starsin
join movie on movietitle = title
where  studioname = 'MGM'
	   and movieyear = '1995';

--3
--първи начин
select name
from movieexec
where "CERT#" in (select "PRODUCERC#"
	          from movie 
		  where studioname = 'MGM')
order by name;

--втори начин
select distinct name
from movieexec
join movie on "CERT#" = movie."PRODUCERC#" 
where studioname = 'MGM';

--4
select title
from movie 
where length > (select length
		from movie
		where title = 'Star Wars')
order by title;

--5
select name
from movieexec 
where networth > (select networth
		  from movieexec 
		  where name = 'Stephen Spielberg')
order by networth;

--6
--първи начин
select title 
from movie
where "PRODUCERC#" in 
		   (select "CERT#" 
		    from movieexec
		    where networth > (select networth 
				      from movieexec
				      where name = 'Stephen Spielberg'))
order by title;

--втори начин
select title
from movie
join movieexec on "PRODUCERC#" = movieexec."CERT#" 
where networth > (select networth
		  from movieexec 
		  where name = 'Stephen Spielberg')
order by title;

--PC

--1
select product.maker, laptop.speed
from laptop inner join product on laptop.model = product.model
where laptop.hd > 9;

--2
--първи подход
select model, price
from laptop 
where model in (select model 
				from product 
				where maker = 'B')
union 
select model, price
from pc 
where model in (select model 
				from product 
				where maker = 'B')
union 
select model, price
from printer
where model in (select model 
				from product 
				where maker = 'B');

--втори подход
select x.model, price
from product x, laptop y 
where maker ='B' and x.model = y.model
union 
select x.model, price
from product x, pc y
where maker ='B' and x.model = y.model
union 
select x.model, price
from product x, printer y
where maker = 'B' and x.model = y.model 

--3
--първи начин
select maker
from product 
where type = 'Laptop'
except 
select maker 
from product
where type = 'PC'

--втори начин
select maker
from product
where type = 'Laptop' and maker not in (select maker
					from product
					where type = 'PC');

--4
--първи начин
select distinct x.hd
from pc x, pc y
where x.hd = y.hd 
      and x.code  != y.code
order by x.hd;

--втори начин
select hd
from pc
group by hd having count(hd) > 1
order by hd;

--5
select x.model, y.model
from pc x, pc y
where x.hd = y.hd and x.speed = y.speed 
	  and x.code < y.code;

--6
select distinct maker
from product p where model in (select model
							   from pc 
							   where speed > 400 
							   group by model having count(model)>1)
order by maker;

--SHIPS

--1
select name 
from ships
where class in (select class 
	        from classes
        	where displacement > 50000)
order by name;

--2
select name, displacement, numguns
from ships x
join classes on x.class = classes.class
where x.name in (select ship
		 from outcomes
		 where battle = 'Guadalcanal')
order by name;

--3
select country 
from classes
where type= 'bb' and country in (select country 
				 from classes 
				 where type = 'bc');

--4
select out1.ship 
from outcomes out1, outcomes out2, battles bat1, battles bat2
where out1.ship = out2.ship and out1.result='damaged'
						and bat1.name = out1.battle 
						and bat2.name = out2.battle
						and bat1.date < bat2.date
