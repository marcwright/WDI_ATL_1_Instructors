DROP TABLE IF EXISTS clowns;

CREATE TABLE  clowns (
id serial PRIMARY KEY,
name varchar(100) NOT NULL,
is_creepy BOOLEAN NOT NULL,
image_url text
);
