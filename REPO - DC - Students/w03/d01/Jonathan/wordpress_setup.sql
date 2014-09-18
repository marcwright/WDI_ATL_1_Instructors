CREATE TABLE posts (
  id serial PRIMARY KEY,
  post_date INTEGER(8),
  title VARCHAR(100) NOT NULL,
  body text,
  slug VARCHAR(50) UNIQUE,
);

CREATE TABLE categories (
  id serial PRIMARY KEY,
  name VARCHAR(100),
  category_id INTEGER REFERENCES categories (id),
);

CREATE TABLE rel_posts_categories (
  id serial PRIMARY KEY,
  category_id INTEGER REFERENCES categories (id),
  post_id INTEGER REFERENCES posts (id),
);
