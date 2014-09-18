CREATE TABLE blog (
  id serial PRIMARY KEY,
  title varchar(200) NOT NULL,
  host_id integer REFERENCES user (id) NOT NULL,
  url varchar(50) NOT NULL
);

CREATE TABLE users (
  id serial PRIMARY KEY,
  name varchar(30) NOT NULL,
  email varchar(50) UNIQUE
);

CREATE TABLE posts (
  id serial PRIMARY KEY,
  author_id integer REFERENCES user (id) NOT NULL,
  title varchar(100),
  content text,
);

CREATE TABLE comments (
  id serial PRIMARY KEY,
  user_id integer REFERENCES user (id) NOT NULL
  content text
);

CREATE TABLE tags (
  id serial PRIMARY KEY,
  post_id integer REFERENCES posts (id) NOT NULL
);

CREATE TABLE categories (
  id serial PRIMARY KEY,
  name varchar(100),
  category_id integer REFERENCES categories (id),
  post_id integer REFERENCES posts (id) NOT NULL
);

CREATE TABLE rel_tags_posts (
  id serial PRIMARY KEY,
  tag_id integer REFERENCES tags (id) NOT NULL,
  post_id integer REFERENCES posts (id) NOT NULL
);

CREATE TABLE categories_posts (
  id serial PRIMARY KEY,
  category_id integer REFERENCES categories (id) NOT NULL,
  post_id integer REFERENCES posts (id) NOT NULL
);
