CREATE TABLE themes (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  image varchar(100) NOT NULL,
  stylesheet varchar(500) NOT NULL
  );

CREATE TABLE users (
  id serial PRIMARY KEY,
  email varchar(300) UNIQUE,
  first_name varchar(100),
  last_name varchar(100)
  );

CREATE TABLE invitations (
  id serial PRIMARY KEY,
  event_id integar REFERENCES EVENTS (id) NOT NULL,
  user_id integer REFERENCES users (id) NOT NULL,
  invite_url varchar(100) NOT NULL,
  accepted_status varchar(1) DEFAULT '?',
  additional_guests integer DEFAULT 0,
  last_accessed timestamp
  );

CREATE TABLE comments (
  id serial PRIMARY KEY,
  even_id integer REFERENCES events (id) NOT NULL,
  user_id integer REFERENCES users (id),
  comment text NOT NULL
  );

