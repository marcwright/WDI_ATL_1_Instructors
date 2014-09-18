drop table if exists paintings;
drop table if exists artists;

create table artists (
  id serial primary key,
  name varchar(100) not null
);

create table paintings (
  id serial primary key,
  title varchar(100) not null,
  artist_id integer references artists(id)
);
