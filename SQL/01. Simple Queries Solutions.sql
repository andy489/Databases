-- github.com/andy489

-- MOVIES
-- 1
select address
from studio
where name = 'Disney';

-- 2
select birthdate
from moviestar
where name = 'Jack Nicholson'; -- name ~ 'Jack Nic'

-- 3
select starname 
from starsin
where movieyear = '1980'
      or movietitle LIKE '%Knight%'; -- movietitle ~ 'Knight'
-- 4  
select name 
from movieexec
where networth > 10000000;

-- 5
select name 
from moviestar
where address LIKE '%Prefect Rd.%' -- address ~ 'Prefect Rd.'
      or gender = 'M';
      
--PC
-- 1
select model, speed as mhz, hd as gb
from pc
where price < 1200;

-- 2
select distinct maker
from product
where type = 'Printer'

-- 3
select model, ram, screen
from laptop
where price > 1000;

-- 4
select * from printer
where color = 'y';

-- 5
select model, speed, hd
from pc
where (cd = '12x' or cd = '16x')
      and price < 1200;
      
-- SHIPS
-- 1
select class, country
from classes
where numguns < 10;

-- 2
select name as shipname
from ships
where launched < 1918 order by name;

-- 3
select ship, battle
from outcomes
where result = 'sunk';

-- 4
select name
from ships
where name = class;

-- 5
select name
from ships
where name LIKE 'R%'; -- name ~ '^R'
-- 6
select name
from ships
where name LIKE '% %' order by name; -- name ~ '.+ .+'
