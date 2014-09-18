DROP TABLE clowns;

CREATE TABLE clowns (
id serial PRIMARY KEY,
name varchar(100) NOT NULL UNIQUE,
talent varchar(140) NOT NULL,
is_creepy boolean NOT NULL,
image_url text
);
