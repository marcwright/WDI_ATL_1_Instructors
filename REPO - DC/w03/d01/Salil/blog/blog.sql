

CREATE TABLE blog (
  id serial PRIMARY KEY,
  title VARCHAR(30) NOT NULL,
  account VARCHAR(30) NOT NULL
  subtitle VARCHAR(140) DEFAULT(" ")
);

CREATE TABLE theme (
  id serial PRIMARY KEY,
  theme VARCHAR(20) NOT NULL,
  image VARCHAR(500) NOT NULL
);

CREATE TABLE blog_posts (
  id serial PRIMARY KEY,
  title VARCHAR(40) NOT NULL,
  post_date VARCHAR(30) NOT NULL,
  post_content text NOT NULL,
  slug text NOT NULL
);

CREATE TABLE categories (
  id serial PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  content text NOT NULL,
  slug VARCHAR NOT NULL
);

CREATE TABLE cateogories_posts (
  id serial PRIMARY KEY,


);

CREATE TABLE tags (
  name VARCHAR(20) NOT NULL
);

CREATE TABLE comments (
  id serial PRIMARY KEY,
  content text NOT NULL,
  user_account VARCHAR(40) NOT NULL
);
