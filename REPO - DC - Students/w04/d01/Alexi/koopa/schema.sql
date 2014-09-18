DROP TABLE IF EXISTS koopas;

-- Run the follwing command inside /koopa root direcotry:
-- psql -d koopa_db -f schema.sql

CREATE TABLE koopas(
  id serial primary key,
  name varchar(50),
  color varchar(20),
  has_shell boolean,
  photo_url text
)
