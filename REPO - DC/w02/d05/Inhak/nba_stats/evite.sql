CREATE TABLE evite (
  id serial PRIMARY KEY,
  event_id integer REFERENCES event(id),
  invitee_id integer REFERENCES invitee(id)
);

CREATE TABLE event(
  id serial PRIMARY KEY,
  host varchar(50) NOT NULL,
  location varchar(100) NOT NULL,
  date_of_event varchar(60) NOT NULL,
  event_title varchar(50) NOT NULL,
  event_description varchar(10000) NOT NULL
);

CREATE TABLE invitee(
  id serial PRIMARY KEY,
  email varchar(50) UNIQUE,
  response varchar(1) NOT NULL,
  id_link varchar(50) UNIQUE,
  num_guests integer DEFAULT = 0,
  message varchar(1000) DEFAULT = ''
);

CREAET TABLE invitations(
last_accessed timestamp
additional_guests integer DEFAULT 0

)
