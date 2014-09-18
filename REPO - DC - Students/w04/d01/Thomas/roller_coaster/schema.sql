DROP TABLE IF EXISTS roller_coasters;

CREATE TABLE roller_coasters (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  min_height integer NOT NULL,
  top_speed integer NOT NULL,
  image_url text
);
