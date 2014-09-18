# Facebook App - (30mins)

* This activity is a code along demo where students follow along with you. Explain each step as you go.
* Open up PostgreSQL and walk students through creating their database. Insert a few people into the database.
* Create a Ruby file to talk to the database.
  * Have the Ruby program print from the database
  * Have the Ruby program insert into the database


CREATE DATABASE facebook;

mkdir facebook
cd facebook
touch facebook.sql
subl facebook.sql

  CREATE TABLE people
  (
    id serial8 primary key,
    first varchar(20) not null,
    last varchar(20) not null,
    dob date check (dob < '1/1/2000'),
    relationship varchar(50),
    friends int2 default 0,
    city varchar (20)
  );

psql -d facebook -f facebook.sql

- go into psql and check out the db and add some records

\d facebook

INSERT INTO people (first, last) VALUES ('jim', 'jones');
INSERT INTO people (first, last) VALUES ('sue', 'smith');
INSERT INTO people (first, last, dob) VALUES ('jil', 'nance', '1/1/2003');

SELECT * FROM people;

gem install pg

touch main.rb

- template code
  https://gist.github.com/Pavling/701ad1358c78ddd089a1
  (mine is in the apps/facebook_app)

- Pry into the code
  - what is "row"?
  
  - how to output first and last name?


- add code to insert


- back to psql and look for our new rows...
