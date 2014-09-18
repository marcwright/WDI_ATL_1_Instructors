

CREATE TABLE travel_log (
  id serial PRIMARY KEY,
  author VARCHAR(50), NOT NULL
);

CREATE TABLE entries (
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  content text NOT NULL,
  tag timestamp DEFAULT current_timestamp
);

CREATE TABLE location (
  id serial PRIMARY KEY,
  city VARCHAR(50) NOT NULL
);
