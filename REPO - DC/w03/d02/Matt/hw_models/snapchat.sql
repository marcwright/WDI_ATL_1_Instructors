CREATE TABLE users (
  id serial PRIMARY KEY,
  username varchar(36) UNIQUE,
  phone_number varchar(12) UNIQUE,
  REFERENCES contacts(id)
);

CREATE TABLE contacts (
  id serial PRIMARY KEY,
);

CREATE TABLE photos (
  id serial PRIMARY KEY,
  destruct_time integer NOT NULL UNIQUE,
  screenshot boolean default 0,
  REFERENCES contacts(id)
);
