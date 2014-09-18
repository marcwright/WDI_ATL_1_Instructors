CREATE TABLE themes (
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  image VARCHAR(50) NOT NULL,
  stylesheet VARCHAR(200) NOT NULL,
);

CREATE TABLE users(
id serial PRIMARY KEY,
email VARCHAR(25) UNIQUE,
first_name VARCHAR(25) NOT NULL,
last_name VARCHAR(25) NOT NULL,
);

CREATE TABLE event (
  id serial PRIMARY KEY,
  theme_id integer REFERENCE themes(id) NOT NULL,
  title VARCHAR(50) UNIQUE,
  time timestamp (5) NOT NULL,
  date_of VARCHAR(10) NOT NULL,
  address1 VARCHAR(50) NOT NULL,
  address1 VARCHAR(50) NOT NULL,
  description VARCHAR(300) NOT NULL,
  comments VARCHAR(300) DEFAULT(''),
  theme VARCHAR(15) UNIQUE,
);

CREATE TABLE invitations (
id serial PRIMARY KEY,
event_id integer REFERENCE event(id) NOT NULL,
user_id integer REFERENCE user(id) NOT NULL,
invite_url VARCHAR(49) NOT NULL,
response_status VARCHAR(1) DEFAULT('?')
last_accessed timestamp
additional_guests integer DEFAULT(0)
);

CREATE TABLE comments(
id serial PRIMARY KEY,
event_id integer REFERENCE event(id) NOT NULL,
user_id integer REFERENCE user(id) NOT NULL,
comment text NOT NULL,
);


