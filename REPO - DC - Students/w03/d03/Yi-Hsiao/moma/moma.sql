-- This app will have 2 models: Artists and Paintings. An Artist has many paintings, and a Painting belongs to an Artist.

drop table if exists paintings;
drop table if exists artists;

create table artists (
  id serial primary key,
  name varchar(127) not null,
  nationality varchar(127) not null
);

create table paintings (
  id serial primary key,
  artist_id integer references artists not null,
  title varchar(127) default "Untitled"
);
