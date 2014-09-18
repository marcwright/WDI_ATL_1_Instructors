DROP TABLE IF EXISTS rollercoasters;

CREATE TABLE rollercoasters(
  id serial primary key,
  name varchar(100),
  top_speed integer,
  image_url text
)
