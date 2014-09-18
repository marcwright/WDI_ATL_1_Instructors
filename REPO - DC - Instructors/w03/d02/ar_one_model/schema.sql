-- # Create a new database
-- # sandbox

-- # Create a table called musicals
-- # id
-- # title
-- # year
-- # composer
-- # lyricist

create table musicals (
  id serial primary key,
  title varchar(100) not null,
  year integer not null,
  composer varchar(100) not null,
  lyricist varchar(100) not null
);