DROP TABLE IF EXISTS roller_coaster;

CREATE TABLE roller_coasters(
  id serial primary key,
  name varchar(100),
  top_speed integer,
  min_height integer,
  image_url text
)
