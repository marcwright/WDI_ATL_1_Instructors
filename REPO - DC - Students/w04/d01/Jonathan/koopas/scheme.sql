DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas(
  id serial primary key,
  name varchar(100) NOT NULL,
  color varchar(20) NOT NULL,
  has_shell boolean NOT NULL DEFAULT true,
  image_url text
)
