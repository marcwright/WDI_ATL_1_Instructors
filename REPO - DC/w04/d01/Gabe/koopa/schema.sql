DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas(
  id serial primary key,
  name varchar(100),
  color varchar(100),
  has_shell boolean default true,
  image_url text
)
