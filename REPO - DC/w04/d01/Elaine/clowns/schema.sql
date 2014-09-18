DROP TABLE IF EXISTS clowns;

CREATE TABLE clowns (
  id serial PRIMARY KEY,
  name varchar(100),
  talent varchar(100),
  is_creepy BOOLEAN,
  image_url text
)
