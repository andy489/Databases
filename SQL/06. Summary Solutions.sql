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
