-- github.com/andy489

-- Data Definition Language

CREATE TABLE students (
	fn INT PRIMARY KEY,
	name VARCHAR(256), 
	dob DATE
);

CREATE TABLE students (
	fn INT CONSTRAINT students_pk PRIMARY KEY CHECK(fn > 0),
	name VARCHAR(256), 
	dob DATE
);

CREATE TABLE universities (
	id SERIAL PRIMARY KEY, -- MySQL: auto increment, MsSQL: identity
	name VARCHAR NOT NULL
);

INSERT INTO universities (name) VALUES ('TU');
INSERT INTO universities (name) VALUES ('PU');
INSERT INTO universities (name) VALUES ('TU');
DELETE FROM universities WHERE id = 4;
INSERT INTO universities (name) VALUES ('NBU');


CREATE TABLE students (
	fn INT PRIMARY KEY CHECK(fn > 0),
	egn VARCHAR(10) UNIQUE,
	name VARCHAR(256) NOT NULL CHECK(length(name) > 0), 
	dob DATE,
	year INT DEFAULT 1,
	university_id INT NOT NULL REFERENCES universities(id),

	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE students (
	fn INT NOT NULL,
	egn VARCHAR(10),
	name VARCHAR(256) NOT NULL, 
	dob DATE,
	year INT DEFAULT 1,
	university_id INT NOT NULL,

	created_at TIMESTAMP NOT NULL DEFAULT NOW(),
	updated_at TIMESTAMP NOT NULL DEFAULT NOW(),

	CONSTRAINT students_pk PRIMARY KEY (fn),
	CONSTRAINT students_egn_uq UNIQUE (egn),
	CONSTRAINT students_university_fk FOREIGN KEY (university_id) REFERENCES universities(id),

	-- CONSTRAINT students_fn_name_ck CHECK(fn > 0 AND length(name) > 0),
	-- Prefer this option:
	CONSTRAINT students_fn_ck CHECK(fn > 0),
	CONSTRAINT students_name_ck CHECK(length(name) > 0)
);

-- PRIMARY KEY -- NOT NULL, UNIQUE, creates an implicit [index]
-- CHECK
-- NOT NULL -- values are unique or null
-- UNIQUE 
-- FOREIGN KEY

INSERT INTO students (fn, name, dob) VALUES (10020, 'Peter Petrov', '1999-10-24');
INSERT INTO students (fn, name, dob) VALUES (10023, 'Ivan Ivanov', '1999-10-24');
INSERT INTO students (fn, name, dob) VALUES (10024, 'Ivan Petrov', '1999-10-24');

DROP TABLE students;

ALTER TABLE students ADD COLUMN city VARCHAR;
ALTER TABLE students DROP COLUMN updated_at;
ALTER TABLE students ADD updated_at TIMESTAMP NOT NULL DEFAULT NOW();
ALTER TABLE students DROP COLUMN city;

-- ALTER TABLE students ADD COLUMN city VARCHAR NOT NULL; -- not working because of null values

-- Option 1: 
ALTER TABLE students ADD COLUMN city VARCHAR;
UPDATE students SET city = 'N/A';
ALTER TABLE students ALTER city SET NOT NULL;

-- Option 2: 
ALTER TABLE students ADD COLUMN city VARCHAR NOT NULL DEFAULT 'N/A';
ALTER TABLE students ALTER city DROP DEFAULT; -- remove the default values

ALTER TABLE students ADD CONSTRAINT students_created_updated_ck CHECK (created_at <= updated_at);

-- Задача 1
-- а) Дефинирайте следните релации:
-- Product (maker, model, type), където:
--  - модел е низ от точно 4 символа,
--  - производител е низ от точно 1 символ,
--  - тип е низ до 7 символа;
CREATE TABLE product (
	maker CHAR(1),
	model CHAR(4),
	type VARCHAR(7)
);

-- Printer (code, model, price), където:
--  - код е цяло число,
--  - модел е низ от точно 4 символа,
--  - цена с точност до два знака след десетичната запетая;
CREATE TABLE printer (
	code INT,
	model CHAR(4),
	price DECIMAL(8,2) -- xxxx,yy
);

-- б) Добавете кортежи с примерни данни към новосъздадените релации.
INSERT INTO product (maker, model, type) VALUES ('A', '1234', 'PRINTER');
INSERT INTO printer (code, model, price) VALUES (101, 'XERO', 1234.10);

-- в) Добавете към релацията Printer атрибути:
--  - type - низ до 6 символа 
--    (забележка: type може да приема стойност 'laser', 'matrix' или 'jet'),
--  - color - низ от точно 1 символ, стойност по подразбиране 'n'
--    (забележка: color може да приема стойност 'y' или 'n').
-- Option 1
ALTER TABLE printer ADD type VARCHAR(6) CHECK(type IN ('laser', 'matrix', 'jet'));
ALTER TABLE printer ADD color VARCHAR(1) NOT NULL DEFAULT 'n' CHECK(color IN ('n', 'y'));
-- ALTER TABLE printer DROP type;
-- ALTER TABLE printer DROP color;

-- Option 2
ALTER TABLE printer ADD type VARCHAR(6);
ALTER TABLE printer ADD color VARCHAR(1) NOT NULL DEFAULT 'n';
									      
-- г) Напишете заявка, която премахва атрибута price от релацията Printer.
ALTER TABLE printer DROP price;

-- д) Изтрийте релациите, които сте създали в Задача 1.
DROP TABLE printer;
DROP TABLE product;
ALTER TABLE printer ADD CONSTRAINT printer_type_ck CHECK(type IN ('laser', 'matrix', 'jet'));
ALTER TABLE printer ADD CONSTRAINT printer_color_ck CHECK(color IN ('n', 'y'));

-- Задача 2
-- а) Нека създадем мини вариант на Facebook. Искаме да имаме следните релации (може да предложите и друг вариант):
-- Users: уникален номер (id), email, парола, дата на регистрация.								    
CREATE TABLE Users (
id INT,
email VARCHAR(255),
password VARCHAR(255),
date DATE
);
								    
-- Friends: двойки от номера на потребители, напр. ако 12 е приятел на 21, 25 и 40, ще има кортежи (12,21), (12,25), (12,40).
CREATE TABLE Friends (
user1 INT,
user2 INT
);

-- Walls: номер на потребител, номер на потребител написал съобщението, текст на съобщението, дата.
CREATE TABLE Walls (
idWriter INT,
idOwner INT,
text VARCHAR(1000)
);

-- Groups: уникален номер, име, описание (по подразбиране - празен низ).
CREATE TABLE Groups (
id INT,
name VARCHAR(255),
description VARCHAR(1000) DEFAULT ''
);

-- GroupMembers: двойки от вида номер на група - номер на потребител.
CREATE TABLE GroupMembers (
userId INT,
groupId INT
);
-- б) Добавете кортежи с примерни данни към новосъздадените релации.
INSERT INTO Friends VALUES(1, 2);
INSERT INTO GroupMembers VALUES(1, 3);
INSERT INTO Groups (id, name) VALUES(5, 'group1');
INSERT INTO Users VALUES (1, 'no@google.com', '123123', '12-04-2019');
INSERT INTO Walls VALUES (1, 2, 'sup');
