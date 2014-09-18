CREATE TABLE clowns (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  talent VARCHAR(50) NOT NULL,
  is_creepy BOOLEAN NOT NULL,
  image_url VARCHAR(150) NOT NULL
);
