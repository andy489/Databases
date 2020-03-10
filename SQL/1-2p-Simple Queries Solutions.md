```sql
-- MOVIES

select address
from studio
where name = 'Disney';

select birthdate
from moviestar
where name = 'Jack Nicholson'; -- name ~ 'Jack Nic'

select starname 
from starsin
where movieyear = '1980'
      or movietitle LIKE '%Knight%'; -- movietitle ~ 'Knight'
      
select name 
from movieexec
where networth > 10000000;

select name 
from moviestar
where address LIKE '%Prefect Rd.%' -- address ~ 'Prefect Rd.'
      or gender = 'M';
      
--PC

select model, speed as mhz, hd as gb
from pc
where price < 1200;

select distinct maker
from product
where type = 'Printer'

select model, ram, screen
from laptop
where price > 1000;

select * from printer
where color = 'y';

select model, speed, hd
from pc
where (cd = '12x' or cd = '16x')
      and price < 1200;
      
-- SHIPS

select class, country
from classes
where numguns < 10;

select name as shipname
from ships
where launched < 1918 order by name;

select ship, battle
from outcomes
where result = 'sunk';

select name
from ships
where name = class;

select name
from ships
where name LIKE 'R%'; -- name ~ '^R'

select name
from ships
where name LIKE '% %' order by name; -- name ~ '.+ .+'
```
