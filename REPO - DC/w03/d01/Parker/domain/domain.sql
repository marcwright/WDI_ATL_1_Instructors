-- Beneath every web application is a database. This database manages tables and schemas that store the application's data. The structure of a database is specific to the business requirements of the application domain.

-- Looking at existing web applications is a great way to think about how to structure your own!

-- Excercise
-- We'll be looking at a few web applications. We want to compose a tangible database schema for each application.

-- Break into pairs.
-- Spend 10 minutes reviewing the application. Consider what it does.
-- Compose an ERD mapping entities, their attributes, and their relationships.
-- When you feel your ERD is complete, circulate the room and see what other groups have. See if another group found something that you missed.
-- Create a new .sql file for the application. Compose SQL that would build all database tables with their attributes and relationships defined. Define attribute datatypes, defaults, and constraints where appropriate.
-- Bonus...
-- If you have additional time, compose SQL at the bottom of the document that would create a database record for each table that you've defined.

CREATE TABLE blogs (
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL,
	title varchar (100) NOT NULL,
	stylesheet varchar (100),
	user REFERENCES users (username),
	about text, 
	url varchar (50)
);

CREATE TABLE posts (
	id serial PRIMARY KEY,
	title varchar(50) NOT NULL,
	location_1 varchar(50) NOT NULL,
	location_2 varchar(50) NOT NULL,
	host_name varchar(50) NOT NULL,
	when integer(12) NOT NULL,
	message text
);

CREATE TABLE posts (
	id serial PRIMARY KEY,
	title varchar(50) NOT NULL,
);

CREATE TABLE categories (
	id serial PRIMARY KEY,
	name varchar(100),
	category_id integer REFERENCES categories (id),	
);

CREATE TABLE categories_posts (
	id serial PRIMARY KEY,
	category_id integer REFERENCES categories (id),	
	posts_id integer REFERENCES posts (id)
);

CREATE TABLE users (
	id serial PRIMARY KEY,
	email varchar(300) UNIQUE,
	first_name varchar(40),
	last_name varchar(40),
	location varchar (100),
	admin BOOLEAN (50)
);

CREATE TABLE comments (
	id serial PRIMARY KEY,
	name varchar (100),
	email varchar (100),
	message text,
	site varchar
);

CREATE TABLE tags(
	id serial PRIMARY KEY,
	name varchar (100)
);

CREATE TABLE tag_to_comments (
	id serial PRIMARY KEY,
	name varchar (100),
	id_number integer (100),
);