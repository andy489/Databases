create table cars (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

create table persons (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(100),
	gender VARCHAR(12) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL,
	car_id BIGINT REFERENCES cars(id),
	UNIQUE(car_id)
);

insert into persons(first_name, last_name, email, gender, date_of_birth, country_of_birth)
values 	('Danyette', 'Kunat', null, 'Female', '1966-02-24', 'China'),
		('Noah', 'Ciccotti', 'nciccotti1@macromedia.com', 'Male', '1987-11-23', 'Argentina'),
		('Gerty', 'Yanson', 'gyanson4@unesco.org', 'Female', '2008-05-29', 'Philippines');

insert into cars(make, model, price)
values ('Land Rover', 'Sterling', 87655.38),
		('GMC', 'Acadia', 17662.69);
