CREATE TABLE blog (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  stylesheet varchar(500) NOT NULL
);

CREATE TABLE posts (
  id serial PRIMARY KEY,
  post_name varchar(50) NOT NULL,
  image varchar(100) DEFAULT = '',
  video varchar(100) DEFAULT = '',
  slug varchar(100) NOT NULL,
  last_changed timestamp
);

CREATE TABLE tags(
  id serial PRIMARY KEY,
  name varchar(25) DEFAULT='',
);

CREATE TABLE comments(
  id serial PRIMARY KEY,
  comment varchar(1000) NOT NULL,
  post_time timestamp
);

CREATE TABLE categories(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  description varchar(400) DEFAULT ='',
  slug varchar(100) NOT NULL,
  parent_category_id integer REFERENCES categories(id)
);

CREATE TABLE posts_tags(
  id serial PRIMARY KEY,
  tag_id integer REFERENCES tags(id),
  post_id integer REFERENCES post(id)
);

CREATE TABLE categories_posts(
  id serial PRIMARY KEY,
  category_id integer REFERENCES categories(id),
  post_id integer REFERENCES post(id)
);

CREATE TABLE blog_posts(
  id serial PRIMARY KEY,
  post_id integer REFERENCES post(id),
  blog_id integer REFERENCES blog(id)s
);
