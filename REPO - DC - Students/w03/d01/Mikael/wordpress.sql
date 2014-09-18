CREATE TABLE posts (
  id serial PRIMARY KEY,
  post_date timestamp,
  title varchar(100) NOT NULL,
  body text,
  slug varchar(20) UNIQUE
);

CREATE TABLE categories(
  id serial PRIMARY KEY,
  name varchar(100),
  category_id integer REFERENCES categories(id)
);

CREATE TABLE categories_posts (
  id serial PRIMARY KEY,
  category_id integer REFERENCES categories (id),
  post_id integer REFERENCES posts (id)
);



-- CREATE TABLE foods (
--   id serial PRIMARY KEY,
--   name varchar(50) NOT NULL,
--   is_vegan boolean,
--   enter_time timestamp,
--   fridge_id integer REFERENCES fridges(id)
-- );

-- CREATE TABLE drinks (
--   id serial PRIMARY KEY,
--   name varchar(50) NOT NULL,
--   size integer NOT NULL,
--   is_alcoholic boolean,
--   fridge_id integer REFERENCES fridges(id)
-- );
