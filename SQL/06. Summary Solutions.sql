-- github.com/andy489

-- MOVIES
-- 1
select title, year, length
from movie
where (length > 120 or length is null) and year < 2000
order by 1;

-- 2
select name, gender
from moviestar
where name like 'J%' and year(birthdate) > 1948
order by name desc;

-- 3
select studioname, count(distinct starname) as num_actors
from movie m join starsin s on m.title = s.movietitle 
group by studioname
having count(starname) > 0
order by 1;

-- 4
select starname, count(movietitle) as num_movies
from starsin
group by starname
order by starname;

-- 5
select t2.studioname, t1.title, t2.year 
from (select studioname, max(year) as year 
	  from movie group by studioname) t2 
	  inner join movie as t1 on t1.studioname = t2.studioname 
	  and t1.year = t2.year
order by 1 desc;

-- 6 
select name
from moviestar
where gender = 'M'
order by birthdate desc limit 1;

-- 7
select t3.studioname, t3.starname, t3.num_movies 
from (select studioname, starname, count(title) as num_movies 
	  from movie right join starsin on movietitle = title 
	  group by studioname, starname) t3 
	  inner join 
	  (select studioname, max(num_movies) as num_movies 
	  from (select studioname, starname, count(title) as num_movies 
	  from movie right join starsin on movietitle = title 
	  group by studioname, starname) t1 group by studioname) t2 
	  on t2.studioname = t3.studioname and t2.num_movies = t3.num_movies;
	  
-- 8
select t1.title, movie.year, count as num_actors
from(select title, count(starname) as count
from movie join starsin on movietitle = title 
group by title having count(starname)>2) t1 
join movie on t1.title = movie.title;

-- SHIPS
-- 1
select distinct ship
from outcomes
where ship like 'C%' or ship like 'K%';

-- 2 
select distinct s.name, c.country
from classes c join ships s on c.class = s."class" 
left join outcomes o on s.name = o.ship 
where o.result != 'sunk' or o.result is null
order by 1;

-- 3
-- first
select c.country, count(o.result)
from classes c left join ships s on c.class = s.class
left join outcomes o on s.name = o.ship
where o.result = 'sunk' or o.result is null
group by c.country
order by 1;

-- second
select country, count(result) 
from (select country, name, result, battle 
from classes c left join ships s on c.class = s.class 
left join outcomes o on o.ship = s.name 
where o.result is null or o.result = 'sunk' or battle is null) t1 
group by country;

-- 4
-- first
select t.name as battle
from (select b.name, count(b.name) as ships_count
from battles b join outcomes o on b.name = o.battle 
group by b.name) t
where t.ships_count >(select count(ship)
from outcomes o join battles b on o.battle = b.name
where name = 'Guadalcanal')
order by battle;

-- second
select battle 
from outcomes 
group by battle 
having count(distinct ship) > (select count(distinct ship) 
			       from outcomes 
			       where battle = 'Guadalcanal');

-- 5
-- first
select t.name as battle
from (select b.name, count(b.name) as ships_count
from battles b join outcomes o on b.name = o.battle 
group by b.name) t
where t.ships_count >(select count(ship)
from outcomes o join battles b on o.battle = b.name
where name = 'Surigao Strait')
order by battle;

-- second 
select battle 
from outcomes 
group by battle 
having count(distinct ship) > (select count(distinct ship) 
			       from outcomes 
			       where battle = 'Surigao Strait');

-- 6
select s.name, t.displacement, t.numguns
from (select class, displacement, numguns
      from classes
      where displacement <= all(select displacement from classes)) t
join ships s on s.class = t.class
where t.numguns >=all(select numguns 
		      from classes 
		      where displacement <=all(select displacement from classes));

-- 7  
select count(distinct ship) as num_ships
from outcomes 
where result = 'ok' and ship in 
(select ship from outcomes where result = 'damaged');
								
-- 8
select o1.ship as ship_name
from outcomes o1
join battles b1 on b1.name like o1.battle
join outcomes o2 on o2.ship like o1.ship
join battles b2 on b2.name like o2.battle
where b2.date > b1.date and o1.result like 'damaged' and o2.result like 'ok';

select t1.ship
from (select o.ship, b.date
	  from outcomes o
	  join battles b on b.name like o.battle
	  where o.result like 'damaged') t1
join (select o.ship, b.date
	  from outcomes o
	  join battles b on b.name like o.battle
	  where o.result like 'ok') t2 on t2.ship like t1.ship and t2.date > t1.date;

-- PC
-- 1
select model
from laptop 
where screen = '15' and model in (select model from laptop where screen = 11);
					       
-- 2
select distinct pc.model
from pc
join product p on p.model = pc.model
join (select l.price, p.maker
	  from laptop l
	  join product p on p.model = l.model) t on t.maker = p.maker
group by pc.model, pc.price, t.price
having t.price > pc.price
order by pc.model;
					       
-- 3
select t1.model, t1.price
from (select p.maker, pc.model, avg(pc.price) as price
	  from pc
	  join product p on p.model = pc.model
	  group by pc.model, p.maker) t1
join (select p.maker, min(l.price) as price
	  from laptop l
	  join product p on p.model = l.model
	  group by p.maker) t2 on t1.maker = t2.maker and t1.price < t2.price
order by price desc;
					       
-- 4
select t.code, p.maker, t.num_pc_higher_price
from pc
join product p on p.model = pc.model
join (select pc1.code, count(*) as num_pc_higher_price
	  from pc pc1
	  cross join pc pc2
	  where pc1.price <= pc2.price
	  group by pc1.code) t on t.code = pc.code; 
					       
