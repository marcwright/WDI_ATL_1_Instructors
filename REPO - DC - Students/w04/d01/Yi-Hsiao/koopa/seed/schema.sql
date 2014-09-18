drop table if exists koopas;
create table koopas (
  id          serial primary key,
  name        varchar(127) not null,
  color       varchar(127) not null,
  has_shell   boolean not null default true,
  photo_url   text not null
);
