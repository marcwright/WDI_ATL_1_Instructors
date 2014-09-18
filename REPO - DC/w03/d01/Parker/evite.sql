CREATE TABLE themes (
	id serial PRIMARY KEY,
	title varchar(100) NOT NULL,
	image
	stylesheet
);


CREATE TABLE events (
	id serial PRIMARY KEY,
	title varchar(50) NOT NULL,
	location_1 varchar(50) NOT NULL,
	location_2 varchar(50) NOT NULL,
	host_name varchar(50) NOT NULL,
	when integer(12) NOT NULL
	message text
);

CREATE TABLE users (
	id serial PRIMARY KEY,
	email varchar(300) UNIQUE,
	first_name varchar(40)
	last_name varchar(40)
);

CREATE TABLE invitations (
	id serial PRIMARY KEY,
	event_id integer REFERENCES events (id) NOT NULL,
	user_id integer REFERENCES users (id) NOT NULL,
	invite_url varchar(1) DEFAULT (?),
	accepted_status varchar(1) DEFAULT '?',
	additional_guests integer DEFAULT (0),
	last_accessed timestamp
);

CREATE TABLE comments (
id serial PRIMARY KEY
event_id integer REFERENCES events (id) NOT NULL,
user_id integer REFERENCES events (id) NOT NULL,
comment text NOT NULL
);