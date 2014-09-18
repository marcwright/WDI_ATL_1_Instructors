drop exists koopas;
create table koopas (
  id serial primary key,
  name varchar(100),
  color varchar(100),
  has_shell boolean,
  image_url text
);
