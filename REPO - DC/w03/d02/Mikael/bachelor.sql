CREATE TABLE women (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  has_rose boolean,
  episode_id integer REFERENCES episodes (id)

);

CREATE TABLE episodes (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  woman_id integer REFERENCES women (id)
);

