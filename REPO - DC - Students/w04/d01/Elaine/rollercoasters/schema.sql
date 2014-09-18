DROP TABLE IF EXISTS rollercoasters;

CREATE TABLE rollercoasters (
  id serial PRIMARY KEY,
  name varchar(100),
  top_speed integer,
  min_height integer,
  image_url text
)
