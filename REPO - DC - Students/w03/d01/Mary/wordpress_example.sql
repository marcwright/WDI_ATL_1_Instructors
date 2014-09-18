CREATE TABLE blogs(
  id serial PRIMARY KEY,
  blog_name varchar(30) UNIQUE NOT NULL,
  url varchar(50) UNIQUE NOT NULL,
  theme integer REFERENCES themes(id)
);

CREATE TABLE users(
  id serial PRIMARY KEY,
  username varchar(20) NOT NULL UNIQUE,
  email_address(30) UNIQUE NOT NULL
);

CREATE TABLE blog_posts(
  id serial PRIMARY KEY,
  title varchar (30) NOT NULL,
  user integer REFERENCES users(id),
  blog integer REFERENCES blogs(id),
  date_and_time timestamp,
  content varchar NOT NULL,
  slug varchar UNIQUE NOT NULL
);

CREATE TABLE comments(
  id serial PRIMARY KEY,
  user integer REFERENCES users(id),
  blog_post integer REFERENCES blog_posts(id),
  content varchar NOT NULL,
  date_and_time timestamp
);

CREATE TABLE posts_tags(
  id serial PRIMARY KEY,
  post integer REFERENCES blog_posts(id),
  tag varchar(50) REFERENCES tags(tag_name)
);

CREATE TABLE categories_posts(
  id serial PRIMARY KEY,
  category varchar(50) REFERENCES categories(category_name),
  post integer REFERENCES blog_posts(id)
);

CREATE TABLE tags(
  tag_name varchar(50) PRIMARY KEY,
  description varchar
);

CREATE TABLE categories(
  category_name varchar(50) PRIMARY KEY,
  description varchar,
  slug varchar UNIQUE NOT NULL,
  parent_category varchar(50) REFERENCES categories(category_name)
);

CREATE TABLE themes(
  id serial PRIMARY KEY,
  theme_name varchar(20) UNIQUE NOT NULL
);
