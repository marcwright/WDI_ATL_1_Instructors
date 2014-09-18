DROP TABLE IF EXISTS roller_coasters;

CREATE TABLE roller_coasters(
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  min_height integer,
  top_speed integer,
  image_url text
);
