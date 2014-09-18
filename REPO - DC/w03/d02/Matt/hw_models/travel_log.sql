CREATE TABLE authors (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  password varchar(80) NOT NULL
);

CREATE TABLE journal_entries (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  entry varchar(9000),
  slug varchar(120) NOT NULL UNIQUE,
  REFERENCES tags(id)
);

CREATE TABLE tags (
  id serial PRIMARY KEY,
  city varchar(100) NOT NULL,
  slug varchar(80) NOT NULL UNIQUE
);
