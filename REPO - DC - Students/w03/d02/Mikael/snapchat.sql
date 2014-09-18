CREATE TABLE users (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  phone_number varchar(12) UNIQUE NOT NULL,
  user_id integer REFERENCES users (id)

);

CREATE TABLE photos (
  id serial PRIMARY KEY,
  time timestamp,
  added_text varchar(100)
);
