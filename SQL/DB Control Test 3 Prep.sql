Movie (title, year, length, inColor, studioName, producerC#)
StarsIn (movieTitle, movieYear, starName)
MovieStar (name, address, gender, birthdate)
MovieExec (name, address, cet#, netWorth)
Studio (name, address, presC#)

-- Find the address of MGM studios
P(address)<-Studio(“MGM”, address, p)

-- Find Sandra Bullock’s birthdate
S(birthdate)<-MovieStar(“Sandra Bullock”, a, g, birthdate)

-- Find all the stars that appeared either in a movie made in 1980 or in “Troy”
Answer(name)<-StarsIn(“Troy”, y, name) AND MovieStar(name, a, g, b)
Answer(name)<-StarsIn(t, “1995”, name) AND MovieStar(name, a, g, b)

-- Find all executives worth at least $10,000,000
P(name)<-MovieExec(name, a,c, netWorth) AND netWorth > 10000000

-- Find all the stars who either are male or live in Malibu
P(name)<-MovieStar(name, “Malibu”, g, b)
P(name)<-MovieStar(name, a, “m”, b)

-- Who were the male stars in Terms of Endearment
P(name)<-StarsIn(“Terms of Endearment”, y, name) AND MovieStar(name, a, “m”, b)

-- or
P(name)<- StarsIn(“Terms of Endearment”, y, name)
Q(name)<- MovieStar(name, a, “m”, b)
Answer(name)<-P(name) and Q(name)

-- Which stars appeared in movies produced by MGM in 1995
MoviesByMGM(movieTitle)<- Movie (movieTitle, y, l, c, “MGM”, p)
MoviesFrom1995(movieTitle)<- Movie (movieTitle, 1995, l, c, s, p)
Answer(name)<- MoviesByMGM(name) AND MoviesFrom1995(name)

-- or
P(name)<- Movie (movieTitle, “1995”, l, c, “MGM”, p)

-- Who is the president of MGM studios
P(name)<- Studio(“MGM”, a1, presC#) AND MovieExec(name, a2, presC#, n)

-- Which movies are longer than Gone With the Wind
P(name)<- Movie (“Gone With the Wind”, y1, length1, c1, s1, p1) AND Movie (name, y2, length2, c2, s2, p2) AND length1 < length2

-- Which executives are worth more than Marv Griffin
P(name)<- MovieExec (name, a1, c1, netWorth1) AND MovieExec (“Marv Griffin”, a2, c2, netWorth2) AND netWorth1 > netWorth2

Product (maker, model, type)
PC (model, speed, ram, hd, rd, price)
Laptop (model, speed, ram, hd, screen, price)
Printer (model, color, type, price)

-- Find the model number, speed, and hard-disk size for all PC’s whose price is under $1200
P(model, speed, hd) <- PC(model, speed, ram, hd, rd, price) AND price < 1200.

-- Find the manufacturers of printers
P(maker) <- Product(maker, model, “printer”) AND Printer(model, c, t, p)

-- Find the model number, memory size, and screen size for laptops costing more than $2000
P(model, hd, screen) <- Laptop(model, s, r, hd, sceen, price) AND price > 2000

-- Find all the tuples in the Printer relation for color printers. Remember that color is a boolean-valued attribute
P(model, type, price) <- Printer(model, “c”, type, price)

-- Find the model number, speed, and hard-disk size for those PC’s that have either a 12x or 16x DVD and a price less than $2000. You may regard the rd attribute as having string type  
P(model, speed, hd) <- PC(model, speed, r, hd, “12x”, price) AND price < 2000.
P(model, speed, hd) <- PC(model, speed, r, hd, “16x”, price) AND price < 2000.

-- Give the manufacturer and speed of laptops with a hard disk of at least thirty gigabytes
P(maker, speed) <- Laptops(model, s, r, hd, s, p) AND hd >= 30 AND Product(maker, model, “laptop”)

-- Find the model number and price of all products made by manufacturer B
Answer(model, price) <- Product(“B”, model, type) AND PC(model, s,r, hd, hr, price)
Answer(model, price) <- Product(“B”, model, type) AND Laptop(model, s,r, hd, screen, price)
Answer(model, price) <- Product(“B”, model, type) AND Printer(model, c,t, price)

-- Find those manufacturers that sell Laptops, but not PC’s
P(maker) <- Product(maker, m, “Laptop”)
Q(maker) <- Product(maker, m, “Printer”)
Answer(maker) <- P(maker) AND NOT Q(maker) // няма проблем, maker го има и в P

-- Find those hard-disk sizes that occur in two or more PC’s
P(hd) <- PC(model1, s1, r1, hd1, hr1, p1) AND PC(model2, s2, r2, hd2, hr2, p2) AND model1 <> model2 // може би ще има повторения, но на лекции казахме, че ги пренебрегваме

-- Find those pairs of PC models that have both the same speed and RAM. A pair should be listed only once, e.g., list (i, j) but not (j, i)
P(model1, model2) <- PC(model1, speed, ram, hd1, hr1, p1) AND PC(model2, speed, ram, hd2, hr2, p2) AND model1 < model2

-- Find those manufacturers of at least two different computers (PC’s or laptops) with speeds of at least 1000
PCandLaptopsWithSpeed(model, maker) <- PC(model, speed, r, hd, rd, p) AND speed > 1000 AND Product(maker, model, “PC”)
PCandLaptopsWithSpeed(model, maker) <- Laptop(model, speed, r, hd, s, p) AND speed > 1000 AND Product(maker, model, “Laptop”)
Answer(maker) <- PCandLaptopsWithSpeed(model1, maker) and PCandLaptopsWithSpeed(model2, maker) and model1 <> model2

Classes (class, type, country, numGuns, bore, displacement)
Ships (name, class, launched)
Battles (name, date)
Outcomes (ship, battle, result)

-- Find the class name and country for all classes with at least 10 guns
P(class, country)<-Classes (class, t, country, numGuns, b, d) AND numGuns >= 1 

-- Find the names of all ships launched prior to 1918
P(name)<-Ships(name, c, launched) AND launched < 1918

-- Find the names of ships sunk in battle and the name of the battle in which they were sunk
P(name, sunk)<-Outcomes(name, battleName, “sunk”) AND Ship(name, class, l) AND Classes (class, t, country, n, b, d) за да знаем че корабите са от някоя страна :)

-- Find all ships that have the same name as their class 
P(name)<-Ships(name, name, l)

-- Find ships heavier than 35,000 tons
P(name)<- Classes (class, t, c, n, b, displacement) AND displacement > 35000 AND ships(name, class, l)

-- List the name, displacement, and number of guns of the ships engaged in the battle of Guadalcanal
P(name, displacement, numGuns)<-Ships(name, class, l) AND Outcomes(name, “Guadalcanal”, r) AND Classes (class, t, c, numGuns, b, displacement)

-- List all the ships mentioned in the database
P(name)<- Ships (name, c, l)
P(name)<-Outcomes(name, b, r) ако някой е участвал в битка без да е пуснат на вода :)

-- Find those countries that have both battleships and battlecruisers
P(country) <- Classes (class, “bb”, country, n, b, d) AND Ships(name, class, l) and Outcomes (name, b, result) AND r <> “sunk”
Q(country) <- Classes (class, “bc”, country, n, b, d) AND Ships(name, class, l) and Outcomes (name, b, result) AND r <> “sunk”
Answer(counry) <- P(country) AND Q(country)

-- Find those ships that were damaged in one battle, but later fought in another
P(name) <- Outcomes(name, battleName1, “damaged”) AND battles(battleName1, date2) AND Outcomes(name, battleName2, r) AND battles(battleName2, date2) AND date2 > date1 AND Ships(name, class, l) за да знаем дали съществува този кораб

-- or
P(name, battleDate)<- Outcomes(name, battleName, “damaged”) AND battles(battleName, battleDate)
Q(name, battleDate)<- Outcomes(name, battleName, r) AND battles(battleName, battleDate)
Answer(name) <- P(name, battleDate1) AND Q(name, battleDate2) AND battleDate1 < battleDate2

-- Find those battles with at least three ships of the same country
P(battle, ship1, ship2, ship3) <- Outcomes(ship1, battle, r1) AND Outcomes(ship2, battle, r2) AND Outcomes(ship3, battle, r3) AND ship1 <> ship2 AND ship1 <> ship3 AND ship2 <> ship3
Q(battle, class1, class2, class3) <- P(battle, ship1, ship2, ship3) AND Ships(ship1, class1, l1) AND Ships(ship2, class2, l2) AND Ships(ship3, class3, l3)
Answer(battle) <- Q(battle, class1, class2, class3) AND Classes (class1, t1, country, n1, b1, d1) AND Classes (class2, t2, country, n2, b2, d2) AND Classes (class3, t3, country, n3, b3, d3)

-- or
Answer(battle) <- Outcomes(ship1, battle, r1) AND Outcomes(ship2, battle, r2) 
AND Outcomes(ship3, battle, r3) 
AND ship1 <> ship2 AND ship1 <> ship3 AND ship2 <> ship3 AND Ships(ship1, class1, l1) 
AND Ships(ship2, class2, l2) AND Ships(ship3, class3, l3) 
AND Classes (class1, t1, country, n1, b1, d1) AND Classes (class2, t2, country, n2, b2, d2) AND Classes (class3, t3, country, n3, b3, d3)
