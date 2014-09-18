CREATE TABLE puppies (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  age integer NOT NULL
);

#psql -d puppy_db -f puppies.sql
