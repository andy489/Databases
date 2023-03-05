# PostgreSQL

### psql

[Download link for mac](https://postgresapp.com/downloads.html)

Terminal-based front-end to PostgreSQL: `psql`

- `\du` - list all users
- `\! clear` - clear screan (control + L)

```sql
ALTER USER andreystoev WITH PASSWORD 'password';
```
`rm ~/.psql_history`

- `\q` - quit psql
- `help` - short help
- `\?` - long help
- `q` - exit help menu or other info in psql
- `\l` - list all current databasess
- `\x` - expanded select on/off

### Create DB

```sql
CREATE DATABASE coffee_shop;
```

How to connect to databases:

`psql --help` - NOT in psql terminall

`psql -h localhost -p 5432 -U andreystoev coffee_shop` - NOT in psql terminal
`\c coffee_shop` - in psql terminal

### Drop DB

```sql 
DROP DATABASE coffee_shop
```

Info about running processes (if some other user is using the db):
```sql
SELECT *, pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE pid <> pg_backend_pid()
AND datname = 'coffee_shop';
```

### Create Table

Template command:
`
CREATE TABLE table_name (
    Column name + data type + constraints if any
);
`

```sql
CREATE DATABASE test;
```
`\c test`

```sql
CREATE TABLE persons (
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(12),
    date_of_birth DATE
);
```
[Link to data types documentation in PostgreSQL](https://www.postgresql.org/docs/11/datatype.html)

`\d` - list of relations
`\d persons` - describe the actual table name

### Creating Tables With Constraints

```sql
DROP TABLE persons;
```

`\d`

```sql
CREATE TABLE persons (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(12) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100)
);
```

`\d persons`

### Insert Into

How to insert records into tables:

```sql
INSERT INTO persons (first_name, last_name, gender, date_of_birth)
VALUES  ('Anne', 'Smith', 'FEMALE', DATE '1988-01-09');

INSERT INTO persons (first_name, last_name, gender, date_of_birth, email)
VALUES('Jake', 'Jones', 'MALE', DATE '1990-01-10', 'jake@gmail.com'),
    ('Pesho', 'Peshev', 'MALE', DATE '1991-09-11', 'peshan@gmail.com');
```

`\dt` - only print tables

```sql
SELECT * FROM persons;
DELETE FROM persons;
```

### Generate 1000 Rows With Mockaroo

[Link to Mockaroo](https://www.mockaroo.com)

```sql
create table persons (
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	gender VARCHAR(12),
	date_of_birth DATE,
	country_of_birth VARCHAR(50)
);
insert into persons (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Sigismund', 'Mayou', null, 'Male', '2022-09-05', 'Portugal');
insert into persons (first_name, last_name, email, gender, date_of_birth, country_of_birth) values ('Alejandro', 'Willgrass', null, 'Male', '2022-05-08', 'China');
```
... up to 1000

```sql
DROP TABLE persons;
```

`\i /Users/andreystoev/Desktop/Github/Databases/PostgreSQL/persons.sql`

```sql
SELECT * FROM persons;
```

```sql
SELECT first_name, last_name FROM persons WHERE id <= 10;

SELECT email FROM persons where id <= 20;
```

### Order By

```sql
SELECT * FROM persons ORDER BY country_of_birth ASC LIMIT 10;
SELECT * FROM persons ORDER BY country_of_birth DESC LIMIT 10;
SELECT * FROM persons ORDER BY date_of_birth, firt_name;
```

### Distinct

```sql
SELECT country_of_birth FROM persons ORDER BY country_of_birth;

SELECT DISTINCT country_of_birth FROM persons ORDER BY country_of_birth;
```

### Where Clause and AND

```sql
SELECT * FROM persons WHERE gender = 'Female';

SELECT * FROM persons WHERE gender = 'Male';

SELECT * FROM persons WHERE gender = 'Female' AND country_of_birth = 'Sweden';
```

All new genders:
```sql
SELECT DISTINCT gender FROM persons WHERE gender != 'Female' AND gender != 'Male';
```
Count of all new genders:
```sql
SELECT COUNT(DISTINCT gender) FROM persons WHERE gender != 'Female' AND gender != 'Male';
```
Count of all persons with new gender:
```sql
SELECT DISTINCT COUNT(gender) FROM persons WHERE gender != 'Female' AND gender != 'Male';
```

```sql
SELECT * FROM persons
WHERE gender = 'Female' AND (country_of_birth = 'Japan' OR country_of_birth = 'China')
AND first_name = 'Paola';
```

### Comparison Operators

Arithmetic operations, comparisons, bitwise and logical operations.

```sql
SELECT 1 = 1;
SELECT 1 < 1;
SELECT 1 >= 2;
SELECT 1 <= 2;
SELECT 1 <> 1;
SELECT 1 <> 2;
SELECT 'postgreSQL' != 'MySQL';
SELECT * FROM persons WHERE date_of_birth >= '2022-03-01' AND date_of_birth < '2022-04-01';
```

### Limit, Offset & Fetch

```sql
SELECT * FROM persons LIMIT 5;

SELECT * FROM persons OFFSET 5 LIMIT 5;

SELECT * FROM persons OFFSET 995;

SELECT * FROM persons OFFSET 5 FETCH FIRST 5 ROW ONLY;

SELECT * FROM persons OFFSET 5 FETCH FIRST ROW ONLY;
```

### IN

Select everyone from China, France or Brazil:

```sql
SELECT * FROM persons WHERE country_of_birth = 'China' OR country_of_birth = 'France' OR country_of_birth = 'Brazil';

SELECT * FROM persons WHERE country_of_birth IN('China', 'France', 'Brazil');

SELECT * FROM persons WHERE country_of_birth IN('Portugal', 'Bulgaria', 'Croatia') ORDER BY country_of_birth;
```

### BETWEEN

Select everyone born between years 2000 and 2015:

```sql
SELECT * FROM persons WHERE date_of_birth BETWEEN DATE'2005-01-01' AND DATE'2007-01-01';
```

### LIKE and iLIKE

Like operator is used to match text values agains a pattern using wild cards.

Every person with email ending with '.uk':
```sql
SELECT * FROM persons WHERE email LIKE '%.uk';
```

Every person with email containing 'bloomberg':
```sql
SELECT * FROM persons WHERE email LIKE '%bloomberg%';
```

Every person with email from 'google':
```sql
SELECT * FROM persons WHERE email LIKE '%@google.%';
```
Every person with email starting with 7 characters followed by @:
```sql
SELECT * FROM persons WHERE email LIKE '_______@%';
```

Every person with country of birth with name starting with 'p' - case insensitive:
```sql
SELECT * FROM persons WHERE country_of_birth iLIKE 'p%';
```

### Group By

```sql
SELECT DISTINCT country_of_birth FROM persons;
```

How many people we have from each of the countries that we have:
```sql
SELECT country_of_birth, COUNT(*) AS cnt
FROM persons
GROUP BY country_of_birth
ORDER BY cnt DESC;
```

### Group By Having

HAVING keyword workd with GROUP BY and allows you to perform an extra filtering after you perform aggregation:

Every country from which at least 10 people are born:
```sql
SELECT country_of_birth, COUNT(*) AS cnt
FROM persons
GROUP BY country_of_birth
HAVING COUNT(*) >= 10
ORDER BY cnt DESC;
```

[Link for All Aggregate Functions](https://www.postgresql.org/docs/11/functions-aggregate.html)

### Adding New Table and Data Using Mockaroo

`\i /Users/andreystoev/Desktop/Github/Databases/PostgreSQL/cars.sql`

```sql
create table cars (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price DECIMAL(19,2)  NOT NULL
);
insert into cars (id, make, model, price) values (1, 'Pontiac', 'LeMans', 95224.68);
```
... up to 1000

### Calculating Min, Max & Average

Find the most expensive car:
```sql
SELECT MAX(price) FROM cars;
```

Find the average price of a car:
```sql
SELECT AVG(price) FROM cars;

SELECT ROUND(AVG(price),2) FROM cars;
```

Find the actial minimum/mazimum car price for each make and model:
```sql
SELECT make, ROUND(AVG(price)) FROM cars
GROUP BY make;

SELECT make, MIN(price) FROM cars
GROUP BY make;

SELECT make, model, MIN(price) FROM cars
GROUP BY make, model;

SELECT make, model, MAX(price) FROM cars
GROUP BY make, model;
```

### Sum

Find the total sum of all cars:
```sql
SELECT SUM(price) FROM cars;
```

Find the total sum of an actual car make:
```sql
SELECT make, SUM(price) FROM cars
GROUP BY make
ORDER BY SUM(price) DESC;
```

### Basic Arithmetic Operators

```sql
SELECT 10 + 2;
SELECT 10 - 2;
SELECT 10 * 2;
SELECT 10 * 2 + 8;
SELECT 8 - 10 / 2;
SELECT 2^10;
SELECT 10 % 4;
```

Find all car prices with 10% discount:
```sql
SELECT id, make, model, price AS original_price, 
ROUND((price * .10),2) AS ten_percent, 
ROUND((price - price * .10),2) AS price_after_discount 
FROM cars LIMIT 10;
```

### Coalesce

```sql
SELECT COALESCE(1);
SELECT COALESCE(1) AS number;
SELECT COALESCE(null, 1) AS number;
SELECT COALESCE(null, null, 1) AS number;
SELECT COALESCE(null, 1, 10) AS number;
```

Select every person and for those that do not have email - display '[email not provided]':
```sql
SELECT id, first_name, last_name, COALESCE(email, '[email not provided]') FROM persons;
```

### NULLIF

Tackles division by zero.

```sql
SELECT 8 / 0;

SELECT NULLIF(10, 10);
SELECT NULLIF(10,1);
SELECT NULLIF(19,100);

SELECT 10 / null;

SELECT 10 / NULLIF(2, 9);

SELECT 10 / NULLIF(0, 0);

SELECT 10 / NULLIF(2, 0);

SELECT COALESCE(10 / NULLIF(0, 0), 0);
```

### Timestamps and Dates

Actual timestamp:
```sql
SELECT NOW();
```
Gather date and time from timestamp
```sql
SELECT NOW()::DATE;
SELECT NOW()::TIME;
```
[Documentation on Date/Time Types](https://www.postgresql.org/docs/11/datatype-datetime.html)

```sql
SELECT NOW() - INTERVAL '1 YEAR';
SELECT NOW() - INTERVAL '10 YEAR';
SELECT NOW() - INTERVAL '10 YEARS';

SELECT NOW() - INTERVAL '10 MONTH';
SELECT NOW() - INTERVAL '10 MONTHS';

SELECT NOW() + INTERVAL '10 DAY';
SELECT NOW() + INTERVAL '10 DAYS';

SELECT (NOW() + INTERVAL '10 DAYS')::DATE;
```

### Extracting Fields

Extract specific value from a timestamp:

```sql
SELECT EXTRACT(YEAR FROM NOW());
SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(DAY FROM NOW());

SELECT EXTRACT(DOW FROM NOW());
SELECT EXTRACT(CENTURY FROM NOW());

SELECT EXTRACT(MINUTES FROM NOW());
```

### Age Function

```sql
SELECT first_name, last_name, gender, country_of_birth, date_of_birth, FROM persons;

SELECT first_name, last_name, gender, country_of_birth, date_of_birth, AGE(NOW(), date_of_birth)::YEARS AS age FROM persons;

SELECT first_name, last_name, gender, country_of_birth, date_of_birth, EXTRACT(YEAR FROM AGE( NOW(), date_of_birth)) AS age FROM persons;
```

### Understanding Primary Keys

```sql
SELECT * FROM persons LIMIT 1;

INSERT INTO persons(id, first_name, last_name, gender, email, date_of_birth, country_of_birth)
VALUES(1, 'Danyette', 'Kunat', 'Female', null, '1966-02-24', 'China');

ALTER TABLE persons DROP CONSTRAINT persons_pkey;

INSERT INTO persons(id, first_name, last_name, gender, email, date_of_birth, country_of_birth)
VALUES(1, 'Danyette', 'Kunat', 'Female', null, '1966-02-24', 'China');
```

Basically id's allows us to have a unique value that identifies a record in a given table

### Adding Primary Key

Primary key recieves an array of values (because you can have a compose primary key):
```sql
DELETE FROM persons WHERE id = 1;
INSERT INTO persons(id, first_name, last_name, gender, email, date_of_birth, country_of_birth)
VALUES(1, 'Danyette', 'Kunat', 'Female', null, '1966-02-24', 'China');
SELECT * FROM persons WHERE id = 1;
ALTER TABLE persons ADD PRIMARY KEY (id);
```

`\d persons`

### Unique Constraints

The unique constraint allow us to have unique values for a given column;

```sql
SELECT email, count(*) FROM persons GROUP BY email;

SELECT email, count(*) FROM persons GROUP BY email HAVING COUNT(*) > 1;

ALTER TABLE persons ADD CONSTR AINT unique_email_address UNIQUE (email);

ALTER TABLE persons DROP CONSTRAINT unique_email_address;

ALTER TABLE persons ADD UNIQUE(email);
```

In the final query we let postgres define the constraint name.

### Check Constraints

The check constraint allows us to add a constraint based on a boolean condition.

```sql
ALTER TABLE persons ADD CONSTRAINT gender_constraint CHECK (gender = 'Female' OR gender = 'Male');
ALTER TABLE persons ADD CONSTRAINT gender_constraint CHECK (gender IN ('Female', 'Male'));
```

### Delete Records

Primary keys allows us to uniquely identify a record in a table. 
When you want to delete a record from a table in most cases you must use a primary key or at least a unique key.

```sql
DELETE FROM persons;
`\i /Users/andreystoev/Desktop/Github/Databases/PostgreSQL/persons.sql`

DELETE FROM persons WHERE id = 2;

DELETE FROM persons WHERE gender NOT IN('Male', 'Female');
SELECT COUNT(*) FROM persons;
```

### Update Records
The upodate command allows us to update a column or multiple columns based on a WHERE clause.
If not providing WHERE clause it will update all rows (analogously to DELETE command).

```sql
UPDATE persons SET email = 'danyette@gmail.com' WHERE id = 1;
SELECT * FROM persons WHERE id = 1;

UPDATE persons SET first_name ='Omar', last_name='Montana', email='omar_montana@gmail.com' WHERE id = 1;
SELECT * FROM persons WHERE id = 1;
```

### On Conflict Do Nothing

For example, if you have a conflict on unique column - your query has no effect.

```sql 
SELECT * FROM persons WHERE id = 3;

INSERT INTO persons(id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
VALUES(3, 'Pesho', 'Peshev', 'pesho@peshev@gmail.com', 'Male', DATE '1952-09-25', 'Norway')
ON CONFLICT (id) DO NOTHING;

INSERT INTO persons(id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
VALUES(3, 'Pesho', 'Peshev', 'danyette@gmail.com', 'Male', DATE '1952-09-25', 'Norway')
ON CONFLICT (email) DO NOTHING;

```

### Upsert

You may want to do something else on conflict and not only ignore your query.

```sql
INSERT INTO persons(id, first_name, last_name, email, gender, date_of_birth, country_of_birth)
VALUES(3, 'Pesho', 'Peshev', 'pesho@peshev@gmail.com', 'Male', DATE '1952-09-25', 'Norway')
ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email, country_of_birth = EXCLUDE.country_of_birth;
```

### Foreign Keys and Joins

#### Relationship

- Person has car
- Person can only have one car
- Car can belong to one person only

In persons table:
`car_id BIGINT REFERENCES cars(id) UNIQUE(car_id)`

In cars table:
`id BIGINT NOT NULL`

### Adding Relationships Between Tables

One person can only have oine car, and one car can only have one person.

```sql
DROP table persons, cars;
```
`\dt`
`\i /Users/andreystoev/Desktop/Github/Databases/PostgreSQL/persons-cars.sql`
`\d persons`

```sql
SELECT * FROM persons;
SELECT * FROM cars;
```

### Updating Foreign Keys Columns

```sql
UPDATE persons SET car_id = 2 WHERE id = 1;
UPDATE persons SET car_id = 1 WHERE id = 2;
```
Foreign key conflict:
```sql
UPDATE persons SET car_id = 3 WHERE id = 3;
```

### Inner Joins

Inner joins is an effective way of combining two tables.
Inner join takes whatever is common in both tables.

Inner join takes two tables A and B and if we have a foreign key that is present in both tablers, 
then we have a new record called C.

```sql
SELECT * FROM persons
JOIN cars ON persons.car_id = cars.id;

SELECT persons.first_name, cars.make, cars.model, cars.price
FROM persons
JOIN cars ON persons.car_id = cars.id;
```

### Left Joins

Left joins allows us to combine two tables like inner joins, and the difference here is that a left join
includes all the rows from the left table A as well as the records from table B that have a corresponding relationship
and also the ones that don't have a corresponding relationship. It returns all the records from A even thosewhich do not have a match 
with record in table B and in that way will generate result C.

```sql
SELECT * FROM persons
LEFT JOIN cars ON cars.id = persons.car_id;

SELECT * FROM persons WHERE car_id IS NULL;

SELECT * FROM persons
LEFT JOIN cars ON cars.id = persons.car_id
WHERE cars.* IS NULL;
```

### Deleting Records with Foreign Keys

```sql
insert into cars(id, make, model, price)
values(13, 'Mazda', 'RX-8', 51272.48);

insert into persons(id, first_name, last_name, gender, email, date_of_birth, country_of_birth)
values(9000, 'John', 'Smith', 'Male', null, DATE '1964-04-03', 'Finland');

SELECT * FROM persons WHERE id = 9000;
SELECT * FROM cars WHERE id = 13;

UPDATE persons SET car_id = 13 WHERE id = 9000;
DELETE FROM cars WHERE id = 13;
```

Whenever you try to delete individual records, make sure that if there is a foreign key constraint, you need to pretty much remove
the foreign key constraint before you perform the actual delition, i.e. if you want to delete car with id 13, you first need
to remove the car_id from person with id 9000 and after that safely delete the car.

So we have two options:
- Delete person with id = 9000, because there is no foreign key constraint between this person and some other table
- update the car_id for user with id = 9000 to null and after that delete the car record

```sql
DELETE FROM persons WHERE id = 9000;
SELECT * FROM persons WHERE id = 9000;
DELETE FROM cars where id = 13;
SELECT * FROM cars WHERE id = 13;
```

### Exporting Query Results to CSV
Generate a CSV with postgres.

```sql
SELECT * FROM persons
LEFT JOIN cars ON cars.id = persons.car_id;
```

`\?`
`\copy (SELECT * FROM persons LEFT JOIN cars ON cars.id = persons.car_id) TO '/Users/andreystoev/Desktop/Github/Databases/PostgreSQL/results.csv' DELIMITER ',' CSV HEADER`

### Serial and Sequences

BIGSERIAL is a special type that increments with some logic managed in a sequence

```sql
SELECT * FROM persons_id_seq;

SELECT * FROM persons;
```

`\d persons`

```sql
SELECT nextval('persons_id_seq'::regclass);
SELECT nextval('persons_id_seq'::regclass);
SELECT nextval('persons_id_seq'::regclass);
```
...

```sql
SELECT * FROM persons_id_seq;

INSERT INTO persons(first_name, last_name, email, gender, date_of_birth, country_of_birth)
VALUES('Maria', 'Magdalena', 'mims@gmail.com', 'Female', DATE '1992-02-12', 'France');

SELECT * FROM persons;
SELECT * FROM persons_id_seq;
```
Sequence is simply stores an INT (when using SERIAL) or a BIGINT (when using BIGSERIAL) and manages it's incrementation.
We can actually restar the actual value;

```sql
SELECT nextval('persons_id_seq'::regclass);
SELECT nextval('persons_id_seq'::regclass);

SELECT * FROM persons_id_seq;
ALTER SEQUENCE persons_id_seq RESTART WITH 1;

INSERT INTO persons(first_name, last_name, email, gender, date_of_birth, country_of_birth)
VALUES('Maria', 'Magdalena', 'mims10@gmail.com', 'Female', DATE '1992-02-12', 'France');
```

### Extensions

[Documentation on PostreSQL Extensions](https://www.postgresql.org/docs/current/external-extensions.html)

Extensions simply add extra functionallity to your database.

View a list of available extensions:
```sql
SELECT * FROM pg_available_extensions;
```

### Understanding UUID Data Type

[Universally unique identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier)

```sql
SELECT * FROM pg_available_extensions;
```

Install extension:
```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

SELECT * FROM pg_available_extensions;
```

Search for "functions" in:
`\?`

`\df`

```sql
SELECT uuid_generate_v4();
SELECT uuid_generate_v4();
```
...

### UUID As Primary Keys

Change both persons and cars to use UUID instead of BISERIAL as Primary Key.
File: `persons-cars-2-uuid.sql`

`\i /Users/andreystoev/Desktop/Github/Databases/PostgreSQL/persons-cars-2-uuid.sql`

```sql
DROP TABLE persons, cars;

SELECT * FROM persons;
SELECT * FROM cars;
```

`\d person`
`\d cars`

```sql
UPDATE persons SET car_uid = '75168e54-b5b9-453a-ba3d-88d161e333df' WHERE person_uid = '1f5b9dbf-9520-43df-8a1c-fab7b393ccfe';
UPDATE persons SET car_uid = '2c3457ef-3a6b-4f84-ae87-87286d897299' WHERE person_uid = 'b2df77ac-d038-4a19-ac31-8f0e08bc2ee7';

SELECT * FROM persons
LEFT JOIN cars ON persons.car_uid = cars.car_uid;

SELECT * FROM persons
LEFT JOIN cars USING (car_uid);

SELECT * FROM persons
LEFT JOIN cars USING (car_uid)
WHERE cars.* IS NULL;
```

