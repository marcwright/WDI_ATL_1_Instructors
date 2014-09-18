DROP TABLE IF EXISTS koopas;

CREATE TABLE koopas (
  id serial primary key,
  name varchar(300) NOT NULL,
  color varchar(300) NOT NULL,
  has_shell boolean,
  image_url text
);

-- psql -d koopa_db -f schema.sql
