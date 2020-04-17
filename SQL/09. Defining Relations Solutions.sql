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
