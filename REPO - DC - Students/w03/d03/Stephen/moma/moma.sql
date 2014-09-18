-- Stephen Stanwood (stephen@stanwoodsolutions.com)

DROP TABLE IF EXISTS artists CASCADE;
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  nationality VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS paintings CASCADE;
CREATE TABLE paintings (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  artist_id INTEGER REFERENCES artists(id)
);
