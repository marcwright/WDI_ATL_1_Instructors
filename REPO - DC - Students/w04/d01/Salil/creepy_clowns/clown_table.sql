DROP TABLE IF EXISTS clowns;

CREATE TABLE clowns (
  id serial primary key,
  name varchar(50) NOT NULL,
  talent varchar(50) NOT NULL,
  is_creepy boolean,
  image_url text
)
