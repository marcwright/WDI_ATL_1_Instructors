CREATE TABLE musicals (
  id        serial PRIMARY KEY,
  title     varchar(127) UNIQUE NOT NULL,
  year      integer NOT NULL,
  composer  varchar(127) NOT NULL,
  lyricist  varchar(127) NOT NULL
);
