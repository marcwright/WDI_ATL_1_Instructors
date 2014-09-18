drop table portfolios;

create table portfolios (
  id serial4 primary key,
  name varchar(255) not null,
  description text,
  category_id integer
);

drop table categories;

create table categories (
  id serial4 primary key,
  name varchar(255) not null
);

-- drop table ingredients;

-- create table ingredients (
--   id serial4 primary key,
--   name varchar(1000) not null
-- );

-- drop table ingredients_recipes;

-- create table ingredients_recipes (
--   ingredient_id integer not null,
--   recipe_id integer not null
-- );

-- create unique index ingredients_recipes_unq on ingredients_recipes (ingredient_id,recipe_id);

