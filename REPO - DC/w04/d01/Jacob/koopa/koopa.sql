DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  color varchar(100) NOT NULL,
  has_shell boolean,
  photo_url text
);
