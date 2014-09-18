CREATE TABLE posts (
id serial PRIMARY KEY,
post_date timestamp NOT NULL,
title VARCHAR(45) NOT NULL,
body text NOT NULL,
slug VARCHAR(60) UNIQUE
);

CREATE TABLE catagories(
id serial PRIMARY KEY,
name VARCHAR(45) UNIQUE,
parent_cat_id integer REFERENCE catagories(id),
description VARCHAR(100) NOT NULL,
slug VARCHAR(60) UNIQUE
);

CREATE TABLE tags(
id serial PRIMARY KEY,
name VARCHAR(45) UNIQUE,
description VARCHAR(100) NOT NULL,
slug VARCHAR(60) UNIQUE
);

CREATE TABLE catagories_posts(
  id serial PRIMARY KEY,
  catagory_id integer REFERENCE catagories(id) NOT NULL
  post_id integer REFERENCE posts(id) NOT NULL,
);

CREATE TABLE rel_posts_t(
  id serial PRIMARY KEY,
  tags_id integer REFERENCE tags(id) NOT NULL,
  catagories_id integer REFERENCE catagories(id) NOT NULL
);
