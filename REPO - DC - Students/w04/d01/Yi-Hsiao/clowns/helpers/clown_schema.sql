drop table if exists clowns;
create table clowns (
  id          serial primary key,
  name        varchar(127) not null,
  talent      varchar(127) not null,
  is_creepy   boolean not null,
  image_url   text not null
);
