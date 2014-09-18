DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas (
  id serial PRIMARY KEY,
  name varchar(100),
  color varchar(50),
  has_shell boolean,
  photo_url text
)
