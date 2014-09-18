CREATE TABLE photos(
  id serial PRIMARY KEY
  shoot_session_date varchar(100) NOT NULL,
  photo varchar(1000) NOT NULL
  time timestamp
);

CREATE TABLE admin(
  id serial PRIMARY KEY,
  upload_time timestamp
);

CREATE TABLE clients(
  id serial PRIMARY KEY,
  login varchar(100) UNIQUE,
  link varchar(100) REFERENCES photos(id),
);
