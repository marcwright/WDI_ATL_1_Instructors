CREATE TABLE authors (
  id serial PRIMARY KEY,
  role varchar(1) NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  email varchar(100) NOT NULL
);

CREATE TABLE categories (
  id serial PRIMARY KEY,
  parent_id integer REFERENCES categories (id),
  title varchar(50) NOT NULL,
  description varchar(200)
);

CREATE TABLE tags (
  id serial PRIMARY KEY,
  title varchar(50) NOT NULL
);

CREATE TABLE posts (
  id serial PRIMARY KEY,
  author_id integer REFERENCES authors (id) NOT NULL,
  category_id integer REFERENCES categories (id) NOT NULL,
  title varchar(100),
  slug varchar(100),
  body text
);

CREATE TABLE comments (
  id serial PRIMARY KEY,
  post_id integer REFERENCES posts (id) NOT NULL,
  name varchar(100),
  email varchar(100),
  url text,
  body text
);

CREATE TABLE posts_tags (
  id serial PRIMARY KEY,
  post_id integer REFERENCES posts (id) NOT NULL,
  tag_id integer REFERENCES tags (id) NOT NULL
);

CREATE TABLE categories_posts (
  id serial PRIMARY KEY,
  category_id integer REFERENCES categories (id) NOT NULL,
  post_id integer REFERENCES posts (id) NOT NULL
);

INSERT INTO roles (title) VALUES ('Admin');
INSERT INTO authors (role_id, first_name, last_name, email) VALUES (1, 'Greg', 'MacWilliam', 'greg@mac.co');
INSERT INTO categories (title) VALUES ('News');
INSERT INTO posts (author_id, category_id, title, body) VALUES (1, 1, 'Hello World!', 'Hello world, all your bases are belong to us.');
INSERT INTO tags (title) VALUES ('Factoids');
INSERT INTO rel_tags_posts (tag_id, post_id) VALUES (1, 1);
INSERT INTO comments (post_id, email, body) VALUES (1, 'fan@boy.co', 'Sounds good!');