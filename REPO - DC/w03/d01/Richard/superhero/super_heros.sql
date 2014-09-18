DROP TABLE IF EXISTS super_heros;

CREATE TABLE super_heros (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  cover varchar(50) NOT NULL,
  has_cape boolean NOT NULL,
  strength varchar(50) NOT NULL,
  rival varchar(50) NOT NULL
);
