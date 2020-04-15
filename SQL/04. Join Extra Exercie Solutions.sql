Напишете заявка, която извежда модел и цена на лаптопите, произведени от производител с име B
SELECT l.model, l.price FROM product p JOIN laptop l ON p.model = l.model WHERE maker = 'B';

-- Напишете заявка, която извежда производителите, които произвеждат лаптопи, но не произвеждат персонални компютри.
SELECT maker FROM product WHERE type = 'Laptop'
EXCEPT
SELECT maker FROM product WHERE type = 'PC'


-- Напишете заявка, която извежда името на студиото и имената на актьорите, участвали във филми, произведени от това студио, подредени по име на студио.
SELECT DISTINCT m.studioname, s.starname 
FROM movie m 
JOIN starsin s ON m.title = s.movietitle AND m.year = s.movieyear 
ORDER BY m.studioname;

-- с пълно сортиране
SELECT DISTINCT m.studioname, s.starname 
FROM movie m 
JOIN starsin s ON m.title = s.movietitle AND m.year = s.movieyear 
ORDER BY m.studioname, s.starname;

-- за всички филми, дори такива без актьори
SELECT DISTINCT m.studioname, s.starname 
FROM movie m 
LEFT JOIN starsin s ON m.title = s.movietitle AND m.year = s.movieyear 
ORDER BY m.studioname, s.starname;

-- за студия, дори такива без филми
SELECT DISTINCT st.name, s.starname 
FROM studio st
LEFT JOIN movie m ON st.name = m.studioname
LEFT JOIN starsin s ON m.title = s.movietitle AND m.year = s.movieyear 
ORDER BY st.name, s.starname;


-- Напишете заявка, която извежда имената на актьорите, които не са участвали в нито един филм.
SELECT name FROM moviestar
EXCEPT
SELECT starname FROM starsin

SELECT ms.name
FROM moviestar ms 
LEFT JOIN starsin si ON ms.name = si.starname 
WHERE si.starname IS NULL;


-- Напишете заявка, която извежда имената и рожденните дати на актьорите, които не са участвали в нито един филм.

SELECT ms.name, ms.birthdate
FROM moviestar ms 
LEFT JOIN starsin si ON ms.name = si.starname 
WHERE si.starname IS NULL;

SELECT name, birthdate FROM moviestar
EXCEPT
SELECT ms.name, ms.birthdate FROM starsin si JOIN moviestar ms ON si.starname = ms.name


-- Напишете заявка, която извежда двойките модели на персонални компютри, които имат еднаква честота и памет. Двойките трябва да се показват само по веднъж, например само (i, j), но не и (j, i).
SELECT 
	p1.code as code_1, p1.model as model_1, 
	p2.code as code_2, p2.model as model_2, 
	p1.speed, p1.ram
FROM pc p1
JOIN pc p2 ON p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model < p2.model;


-- Напишете заявка, която извежда имената на тези кораби,
-- които са били повредени в една битка,
-- но по-късно са участвали в друга битка.

SELECT *
FROM (SELECT o.ship, o.result, b.date
	  FROM outcomes o
	  JOIN battles b ON o.battle = b.name
	  WHERE o.result = 'damaged') data1
JOIN (SELECT o.ship, o.result, b.date
      FROM outcomes o
      JOIN battles b ON o.battle = b.name) data2 ON data1.ship = data2.ship AND data1.date &lt; data2.date;
-- subqueries

SELECT *
FROM outcomes o1
JOIN battles b1 ON o1.battle = b1.name
JOIN outcomes o2 ON o1.ship = o2.ship
JOIN battles b2 ON o2.battle = b2.name
WHERE b1.date < b2.date
AND o1.result = 'damaged';
