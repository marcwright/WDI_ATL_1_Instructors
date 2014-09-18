DROP TABLE IF EXISTS calculations;

CREATE TABLE calculations(
  id serial PRIMARY KEY,
  calculation varchar(100) NOT NULL
);
