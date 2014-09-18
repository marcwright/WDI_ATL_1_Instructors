CREATE TABLE event(
  id serial PRIMARY KEY,
  title VARCHAR(140) NOT NULL,
  when INTEGER UNIQUE NOT NULL,
  location_title VARCHAR(60) NOT NULL,
  location_address VARCHAR?,
  host_account VARCHAR UNIQUE NOT NULL,
);

CREATE TABLE invitation(
  id serial PRIMARY KEY,

);

CREATE TABLE user(
  id serial PRIMARY KEY,

);
