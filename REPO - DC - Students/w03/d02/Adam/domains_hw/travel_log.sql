CREATE TABLE entries (
  id serial PRIMARY KEY,
  city varchar(30) NOT NULL,
  content varchar(500) NOT NULL,
);

CREATE TABLE tags (
  id serial PRIMARY KEY,
  parent_id integer REFERENCES tags (id),
);

CREATE TABLE location_keys (
  id serial PRIMARY KEY
  location varchar(100) NOT NULL
);
