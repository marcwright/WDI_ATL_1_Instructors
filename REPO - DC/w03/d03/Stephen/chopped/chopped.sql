-- Stephen Stanwood (stephen@stanwoodsolutions.com) --

DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS judges;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS chefs;

CREATE TABLE chefs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  alive_status BOOLEAN DEFAULT TRUE NOT NULL
);

CREATE TABLE rounds (
  id SERIAL PRIMARY KEY,
  food_type VARCHAR(100) NOT NULL
);

CREATE TABLE judges (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE dishes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE scores (
  id SERIAL PRIMARY KEY,
  points INTEGER NOT NULL,
  round_id INTEGER REFERENCES rounds(id),
  dish_id INTEGER REFERENCES dishes(id),
  judge_id INTEGER REFERENCES judges(id),
  chef_id INTEGER REFERENCES chefs(id)
);
