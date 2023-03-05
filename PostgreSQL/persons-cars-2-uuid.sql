create table cars (
	car_uid UUID NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL CHECK (price > 0)
);

create table persons (
	person_uid UUID NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100),
	gender VARCHAR(12) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL,
	car_uid UUID REFERENCES cars(car_uid),
	UNIQUE(car_uid),
	UNIQUE(email)
);

-- INSERT INTO persons
insert into persons(person_uid, first_name, last_name, email, gender, date_of_birth, country_of_birth)
values 	(uuid_generate_v4(), 'Danyette', 'Kunat', null, 'Female', '1966-02-24', 'China'),
		(uuid_generate_v4(), 'Noah', 'Ciccotti', 'nciccotti1@macromedia.com', 'Male', '1987-11-23', 'Argentina'),
		(uuid_generate_v4(), 'Gerty', 'Yanson', 'gyanson4@unesco.org', 'Female', '2008-05-29', 'Philippines');

-- INSERT INTO cars
insert into cars(car_uid, make, model, price)
values  (uuid_generate_v4(), 'Land Rover', 'Sterling', 87655.38),
		(uuid_generate_v4(), 'GMC', 'Acadia', 17662.69);
