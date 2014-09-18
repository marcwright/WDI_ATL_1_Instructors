DROP TABLE IF EXISTS clowns;

CREATE TABLE clowns (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  talent varchar(100) NOT NULL,
  is_creepy boolean,
  image_url text
);
