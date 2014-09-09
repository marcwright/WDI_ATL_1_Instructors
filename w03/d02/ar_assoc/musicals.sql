CREATE TABLE musicals (
  id serial primary key,
  title varchar(100) not null,
  year integer not null,
  composer varchar(100) not null,
  lyricist varchar(100) not null
);

CREATE TABLE songs(
  id serial primary key,
  title varchar(100),
  musical_id integer references musicals(id)
);

CREATE TABLE characters(
  id serial primary key,
  name varchar(100)
);

CREATE TABLE performances(
  id serial primary key,
  song_id integer references songs(id),
  character_id integer references characters(id)
);