CREATE TABLE travel_log (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  image varchar(100) NOT NULL,
  entries_id integer REFERENCES entries (id) NOT NULL,
  );

CREATE TABLE entries (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  image varchar(100) DEFAULT = '',
  video varchar(100) DEFAULT = '',
  tagss_id integer REFERENCES tags (id) NOT NULL,
  last_accessed timestamp
  );

CREATE TABLE tags (
  id serial PRIMARY KEY,
  name varchar(25) NOT NULL,
  city_state varchar(100) DEFAULT = '',
  );

