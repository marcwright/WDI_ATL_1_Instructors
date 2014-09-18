DROP TABLE IF EXISTS clowns;
#text is good for URL's because they can get really long
CREATE TABLE clowns(
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  talent varchar,
  is_creepy boolean,
  image_url text
);
