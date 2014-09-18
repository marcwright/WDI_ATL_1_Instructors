--CREATE TABLE theme(
--name VARCHAR(50) NOT NULL);
--
--CREATE TABLE blog(
--)

CREATE TABLE blogs(
id
title);

CREATE TABLE authors(
id
name
login
email);

CREATE TABLE posts(
id serial PRIMARY KEY NOT NULL,
subject
post_date
body_text
slug(unique url)
);

CREATE TABLE posts_to_tags_relationships(
id serial PRIMARY KEY NOT NULL,
post_ref_number INTEGER REFERENCES posts(id),
tag_ref_number INTEGER REFERENCES tags(id));

CREATE TABLE tags(
id
tag_name);

CREATE TABLE posts_to_cats(
id serial PRIMARY KEY NOT NULL,
post_ref_number INTEGER REFERENCES posts(id),
cat_ref_number INTEGER REFERENCES categories(id)););


CREATE TABLE categories(
id
cat_name);





CREATE TABLE comments(
id
commentor_name
commentor_email
comment_title
comment_text);