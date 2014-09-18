-- Creates a superhero database
CREATE DATABASE superhero;

CREATE TABLE superheroes (
  id              serial PRIMARY KEY,
  name            varchar(255) UNIQUE NOT NULL,
  alter_ego       varchar(255) DEFAULT '',
  has_cape        boolean DEFAULT false,
  archnemesis     varchar(255) DEFAULT ''
);

CREATE TABLE powers (
  id      serial PRIMARY KEY,
  power   varchar(255) UNIQUE NOT NULL
);

CREATE TABLE powers_superheroes (
  id            serial PRIMARY KEY,
  power_id      integer REFERENCES powers,
  superhero_id  integer REFERENCES superheroes
);
