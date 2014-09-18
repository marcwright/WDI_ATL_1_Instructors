CREATE TABLE event(
  id serial PRIMARY KEY,
  date date NOT NULL,
  time decimal(2,2) NOT NULL,
  location1 varchar(50) NOT NULL,
  location2 varchar (50),
  title varchar (50) NOT NULL,
  message text
  host integer REFERENCES user(id)
  );

CREATE TABLE invitation(
  id serial PRIMARY KEY,
  user integer REFERENCES user(id) NOT NULL,
  event integer REFERENCES event(id) NOT NULL,
  rsvp varchar(10) DEFAULT 'NOT YET REPLIED',
  additional_guests varchar(1) DEFAULT 'N',
  invite_url varchar(20) UNIQUE NOT NULL,
  last_accessed timestamp ,
);

CREATE TABLE user(
  id serial PRIMARY KEY,
  email varchar(20) NOT NULL UNIQUE,
  first_name varchar(20) NOT NULL,
  last_name varchar(20) NOT NULL,
);

CREATE TABLE comments(
  id serial PRIMARY KEY,
  user integer REFERENCES user(id) NOT NULL,
  event integer REFERENCES event(id) NOT NULL,
  comment text NOT NULL
);

