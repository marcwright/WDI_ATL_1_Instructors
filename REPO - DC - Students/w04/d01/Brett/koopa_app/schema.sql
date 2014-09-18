CREATE TABLE koopas(
id serial PRIMARY KEY,
name varchar(100) NOT NULL,
color varchar(100) NOT NULL,
has_shell boolean DEFAULT true
photo_url text NOT NULL
);
