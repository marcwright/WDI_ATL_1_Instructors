CREATE TABLE event (
  id serial PRIMARY KEY,
  name varchar(200) NOT NULL,
  host_id integer REFERENCES user (id) NOT NULL,
  event_date varchar(50) NOT NULL,
  event_time varchar(50) NOT NULL,
  location varchar(50) NOT NULL
);

CREATE TABLE invitation (
  id serial PRIMARY KEY,
  event_id integer REFERENCES event (id) NOT NULL,
  invitee_id integer REFERENCES user (id) NOT NULL,
  response varchar(10) DEFAULT 'Not Yet Replied',
  view_time varchar(10) NOT NULL,
  response_time varchar(10) NOT NULL,
  guests integer DEFAULT '1',
);

CREATE TABLE user (
  id serial PRIMARY KEY,
  email varchar(50) UNIQUE,
  name varchar(50) NOT NULL,
);

CREATE TABLE comments (
  id serial PRIMARY KEY,
  user_id integer REFERENCES user (id) NOT NULL
);
