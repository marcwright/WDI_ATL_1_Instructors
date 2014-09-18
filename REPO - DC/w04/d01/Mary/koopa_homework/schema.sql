DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas(
  id serial PRIMARY KEY,
  name varchar,
  color varchar,
  has_shell boolean NOT NULL DEFAULT true,
  image_url text
);
