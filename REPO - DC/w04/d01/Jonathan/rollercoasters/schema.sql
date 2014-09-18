DROP TABLE IF EXISTS rollercoasters;

CREATE TABLE rollercoasters(
  id serial primary key,
  name varchar(100) NOT NULL,
  top_speed integer NULL,
  min_height integer NOT NULL,
  image_url text
)
