
CREATE TABLE theme (
  id SERIAL PRIMARY,
  title varchar(100)
);


CREATE TABLE event (
  id SERIAL PRIMARY,
  location1 VARCHAR(15),
  location2 VARCHAR(15),
  title VARCHAR(25) NOT NULL,
  theme integer REFERENCES theme (id) NOT NULL,
  host_name integer REFERENCES user (id) NOT NULL
  );

CREATE TABLE user (
  id SERIAL PRIMARY,
  email VARCHAR(25) UNIQUE,
  first_name VARCHAR(15) NOT NULL,
  last_name VARCHAR(15) NOT NULL,
);

CREATE TABLE invitation (
  id SERIAL PRIMARY,
  host_name integer REFERENCES user (id) NOT NULL,
  event integer REFERENCES event (id) NOT NULL,
  rsvp VARCHAR(10)NOT NULL default ' ',
  additional_guests integer(10),
  invite_url varchar(100) UNIQUE,
  last_accessed timestamp
);

CREATE TABLE comments (
  id SERIAL PRIMARY,
  user integer REFERENCES user (id) NOT NULL,
  comments VARCHAR(100)

);
