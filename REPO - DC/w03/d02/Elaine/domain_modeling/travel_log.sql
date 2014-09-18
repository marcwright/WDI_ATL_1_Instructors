CREATE TABLE posts (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  entry_date date NOT NULL,
  content text NOT NULL,
);

CREATE TABLE tags (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  post_id integer REFERENCES posts (id) NOT NULL
);

