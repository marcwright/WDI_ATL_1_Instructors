DROP TABLE IF EXISTS coasters;

CREATE TABLE coasters (
  id serial primary key,
  name varchar(300) NOT NULL,
  speed integer,
  height_requirement integer,
  image_url text
);
