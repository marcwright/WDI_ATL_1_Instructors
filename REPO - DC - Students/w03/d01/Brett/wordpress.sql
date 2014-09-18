CREATE TABLE posts (
id serial PRIMARY KEY,
title varchar(140),
body text NOT NULL,
post_date timestamp NOT NULL,
slug text NOT NULL
category_id integer REFERENCES rel_posts_to_categories (id)
tag_id integer REFERENCES rel_posts_to_tags (id)
);

CREATE TABLE categories (
id serial PRIMARY KEY,
name varchar(100),
description text,
slug text NOT NULL,
category_id integer REFERENCES categories (id)
);

CREATE TABLE categories_posts (
id serial PRIMARY KEY,
category_id integer REFERENCES categories (id),
post_id integer REFERENCES posts(id)
);

CREATE TABLE tags (
id serial PRIMARY KEY,
name varchar(100),
);

CREATE TABLE posts_tags (
id serial PRIMARY KEY,
post_id integer REFERENCES posts (id) NOT NULL,
tag)id integer REFERENCES tags (id) NOT NULL
)
