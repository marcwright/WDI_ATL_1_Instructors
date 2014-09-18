CREATE TABLE clowns (
id serial PRIMARY KEY,
name VARCHAR(42),
talent VARCHAR(150),
is_creepy BOOLEAN,
image_url varchar(300) NOT NULL
);
