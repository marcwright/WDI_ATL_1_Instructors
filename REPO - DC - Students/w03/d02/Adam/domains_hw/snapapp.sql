CREATE TABLE users (
  id serial PRIMARY KEY,
  parent_id integer REFERENCES users (id),
);

CREATE TABLE photo (
  id serial PRIMARY KEY,
  picture varchar(100) NOT NULL,
);
