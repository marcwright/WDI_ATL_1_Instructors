DROP TABLE IF EXISTS clowns;

CREATE TABLE clowns (
  id serial PRIMARY KEY,
  name varchar(100),
  talent varchar(100),
  is_creepy boolean,
  image_url text
);
