-- ###Travel Log
-- You are building an app to help you keep track of our travels. The app will allow you to write journal entries and tag each entry with the city you're writing in. This should allow you to go back and retrive all entries for a particular locale.

CREATE TABLE travel_log (
  id serial PRIMARY KEY,
  city VARCHAR(50) NOT NULL,
  entry_title VARCHAR(75) NOT NULL,
  entry text,
  date NOT NULL
);

CREATE TABLE tags (
  id serial PRIMARY KEY,
  tag VARCHAR(50),
  entry_id REFERENCES travel_log (id) NOT NULL,
);
