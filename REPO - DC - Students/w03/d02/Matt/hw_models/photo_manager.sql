CREATE TABLE photographers (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  password varchar(80) NOT NULL
);

CREATE TABLE albums (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  description varchar(9000),
  slug varchar(120) NOT NULL UNIQUE,
  permission boolean,
  REFERENCES tags(id)
);

CREATE TABLE photos (
  id serial PRIMARY KEY,
  title varchar(100),
  description varchar(9000),
  slug varchar(80) NOT NULL UNIQUE,
  REFERENCES albums(id)
);

CREATE TABLE clients (
  id serial PRIMARY KEY,
  name varchar(100),
  password varchar(80)
  REFERENCES albums(id)
);
