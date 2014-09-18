DROP TABLE IF EXISTS players;

CREATE TABLE blog

CREATE TABLE posts (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL
);

CREATE TABLE categories (
  id serial PRIMARY KEY,
  name varchar(100)
  parent_category_id integer REFERENCES categories (id)
);

CREATE TABLE categories_posts (
  id serial PRIMARY KEY,
  category_id integer REFERENCES categories (id),
  posts_id integer REFERENCES posts (id),
);

