DROP TABLE IF EXISTS coasters;

CREATE TABLE coasters (
  id serial PRIMARY KEY,
  min_height integer NOT NULL,
  top_speed integer NOT NULL,
  name varchar(100) NOT NULL,
  image_url text
);
