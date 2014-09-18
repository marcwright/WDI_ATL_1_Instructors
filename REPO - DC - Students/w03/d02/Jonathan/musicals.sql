CREATE TABLE musicals (
  id serial primary key,
  title varchar(100) NOT NULL,
  year integer NOT NULL,
  composer varchar(100) NOT NULL,
  lyricist varchar(100)
);
