CREATE TABLE users (
  id serial PRIMARY KEY,
  email varchar(50) UNIQUE,
  username varchar(50) UNIQUE,
  password varchar(50) NOT NULL
);

CREATE TABLE photos (
  id serial PRIMARY KEY,
  user_id integer REFERENCES users (id) NOT NULL,
  friend_id integer REFERENCES users (id) NOT NULL
);
