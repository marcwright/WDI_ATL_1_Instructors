CREATE DATABASE posts (
  id serial PRIMARY KEY,
  title varchar(120) NOT NULL,
);

CREATE DATABASE categories (
  id serial PRIMARY KEY,
  category varchar(80) NOT NULL,
  slug varchar(80) NOT NULL UNIQUE,
  parent_category_id integer REFERENCES categories (id)
);

CREATE DATABASE categories_posts (
  id serial PRIMARY KEY,
  parent_category_id integer REFERENCES categories (id)
  post_id integer REFERENCES posts (id)
);
