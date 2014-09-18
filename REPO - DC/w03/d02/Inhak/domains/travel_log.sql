CREATE TABLE cities(
  id serial PRIMARY KEY,
  city_name varchar(50) NOT NULL,
  country varhcar(50) UNIQUE,
  post_reference integer REFERENCES posts(id)
);

CREATE TABLE posts(
  id serial PRIMARY KEY,
  post_title varchar(100) NOT NULL,
  content varchar(10000) NOT NULL,
  tag integer REFERENCES cities(id)
);
