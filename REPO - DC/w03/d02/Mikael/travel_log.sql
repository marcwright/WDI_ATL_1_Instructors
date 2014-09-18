CREATE TABLE entries (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  body text NOT NULL,
  time timestamp
);

CREATE TABLE location_tags (
  id serial PRIMARY KEY,
  city_name varchar(100)
);
