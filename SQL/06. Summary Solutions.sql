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
