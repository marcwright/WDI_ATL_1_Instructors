CREATE TABLE coasters (
id serial PRIMARY KEY,
name VARCHAR(42),
max_height INTEGER NOT NULL,
top_speed INTEGER NOT NULL,
image_url TEXT NOT NULL
);
