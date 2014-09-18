CREATE TABLE rollercoasters(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL UNIQUE,
  min_height integer,
  top_speed integer NOT NULL,
  image_url text
);
