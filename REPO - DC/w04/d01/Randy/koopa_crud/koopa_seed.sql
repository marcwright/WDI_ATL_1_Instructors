CREATE TABLE koopas (
id serial PRIMARY KEY,
name VARCHAR(42) NOT NULL,
color VARCHAR(42) NOT NULL,
has_shell BOOLEAN DEFAULT true,
photo_url TEXT NOT NULL
);
