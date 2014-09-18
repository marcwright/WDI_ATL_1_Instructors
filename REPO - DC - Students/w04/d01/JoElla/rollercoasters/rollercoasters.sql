drop exists rollercoasters;
create table rollercoasters (
  id serial primary key,
  name varchar(100),
  min_height integer,
  top_speed integer,
  image_url text
);
