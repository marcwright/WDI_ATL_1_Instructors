CREATE TABLE blog (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  image varchar(100) NOT NULL,
  stylesheet varchar(500) NOT NULL,
  users_id integer REFERENCES users (id) NOT NULL,
  );

CREATE TABLE posts (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  image varchar(100) DEFAULT = '',
  video varchar(100) DEFAULT = '',
  last_accessed timestamp
  );

CREATE TABLE categories (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  description varchar(250) NOT NULL,
  slug varchar(100) NOT NULL,
  category_id integer REFERENCES categories (id)
);
CREATE TABLE tags (
  id serial PRIMARY KEY,
  name varchar(25) NOT NULL,
  description varchar(100) NOT NULL,
  posts_id integer REFERENCES posts (id) NOT NULL,
  );

CREATE TABLE post_categories_rel (
  id serial PRIMARY KEY,
  posts_id integer REFERENCES posts (id),
  category_id integer REFERENCES categories (id)
);
CREATE TABLE posts_tags_rel (
  id serial PRIMARY KEY,
  tags_id integer REFERENCES tags (id) NOT NULL,
  posts_id integer REFERENCES posts (id) NOT NULL
  );

CREATE TABLE users (
  id serial PRIMARY KEY,
  email varchar(300) UNIQUE,
  first_name varchar(100),
  last_name varchar(100),
  );

CREATE TABLE comments (
  id serial PRIMARY KEY,
  author varchar(100) NOT NULL,
  comment_time timestamp
  comment text NOT NULL
  );
