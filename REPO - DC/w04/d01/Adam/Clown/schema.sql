CREATE TABLE IF EXISTS clowns;

CREATE TABLE clowns(
  id serial primary key,
  name varchar(100),
  talent varchar(100),
  is_creepy boolean,
  image_url text
)
