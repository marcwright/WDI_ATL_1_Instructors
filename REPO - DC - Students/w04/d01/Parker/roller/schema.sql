DROP TABLE IF EXISTS rollers;

CREATE TABLE rollers(
  id serial primary key,
  name varchar(100),
  speed integer,
  height integer,
  image_url text
)