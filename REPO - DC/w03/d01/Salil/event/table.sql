CREATE TABLE event (
  id serial PRIMARY KEY,
  title VARCHAR(50) UNIQUE,
  time VARCHAR (5) NOT NULL,
  day VARCHAR(10) NOT NULL,
  address1 VARCHAR(50) NOT NULL,
  address1 VARCHAR(50) NOT NULL,
  host_name VARCHAR(20) NOT NULL,
);

CREATE TABLE invitation (
id serial PRIMARY KEY,
name VARCHAR(44) NOT NULL,
invite_url VARCHAR NOT NULL,
response VARCHAR(1) DEFAULT('')
);

CREATE TABLE event_to_invitees (
id serial PRIMARY KEY,
invitees_id integer REFERENCES invitees(id) NOT NULL,
event_id integer REFERENCES event(id) NOT NULL,
);

CREATE TABLE event (
  comment_id integer REFERENCES invitees id
  message VARCHAR(140) DEFAULT(" ")
);
