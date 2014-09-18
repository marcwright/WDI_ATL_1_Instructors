DROP TABLE IF EXISTS roller_coasters;
DROP TABLE IF EXISTS coasters;

CREATE TABLE coasters(
  id serial primary key,
  name varchar(100),
  top_speed VARCHAR(100) NOT NULL,
  min_height VARCHAR(100) NOT NULL,
  image_url text
)
