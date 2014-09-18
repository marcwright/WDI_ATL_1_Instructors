DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS painting;

CREATE TABLE artists (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  nationality VARCHAR(50) NOT NULL
);

CREATE TABLE paintings (
  id serial PRIMARY KEY,
  title VARCHAR NOT NULL,
  artist INTEGER references artists(id)
);
