


CREATE TABLE actors (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
);

CREATE TABLE movies (
  title VARCHAR(50) NOT NULL,
  year integer NOT NULL
  
);

CREATE TABLE roles (
  id serial PRIMARY KEY,
  movie_id VARCHAR(50) NOT NULL,
  name_id VARCHAR(50) NOT NULL,
  PRIMARY KEY(actor_id, name_id)
);
