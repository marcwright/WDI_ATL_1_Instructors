# Coffee and scrum | 8:30 - 9:00
- Talk about the principles of scrum.
- Say what I did last week, what I'm doing this week (review the board and re-write)
- Each student has 1 minute to explain what they did over the weekend, and what they aim for the week, and any blockers)

# GASE homework review | 9:00 - 10:15
- Address blockers from scrum
- HW Code Review - Review the solution to the GA Stock Exchange Lab.

# Break

# Survivor game | 10:30 - 12:00
- Divide students into groups of 5 (use LabPartners app!)

- Each group should come up with a team name.

- Each team will come up with quiz questions related to what you’ve learned thus far. The questions can be definitions or about how to code (not a lot, just a few lines).

- The instructor should select two groups to begin.

- One group should ask the other one of their quiz questions. The group can discuss what they think the answer is, but they may not look at their notes. If they answer incorrectly, they are eliminated. If they answer correctly, the team that asked the question has to be able to determine if the answer is correct. If they cannot do that, they are eliminated.
  - example: "What are the benefits of DRY programming?" "How do you define a custom exception?"

* Survivor questions and team scores should be kept in a separate file and shared with students.


# Databases | 1:00 - 4:30 (break in the middle)
Install PG app:
http://postgresapp.com/

Objectives:

Create basic databases and use CRUD commands
Activity:

Introduce the following concepts with students, using the whiteboard for support.
What is a database?
Types of databases
CRUD

Open up PostgreSQL and walk students through creating their first database. Explain each step as you go and have students follow along.

Demonstrate CRUD commands using a table of people
Ask students how they would store data using databases if they had to model a school where students could take various classes.

Introduce the concept of primary and foreign keys with students, using the whiteboard for support.
Demonstrate using students & classes example

  which psql

  brew install postgresql
  initdb /usr/local/var/postgres -E utf8
  mkdir -p ~/Library/LaunchAgents
  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist


  psql
  createdb your_name
  \q to quit

  - in psql:
  create database people_app;
  \c people_app
  \d
  create table people (
    name varchar(255),
    age int2,
    sex char(1)
    );
  \d
  \d people

  SELECT * FROM PEOPLE;
  INSERT INTO PEOPLE (first) VALUES ('bob');

  SELECT * FROM PEOPLE;
  INSERT INTO people (age) VALUES (35);

  INSERT INTO people (first, age) VALUES ('jill', 22);
  SELECT * FROM PEOPLE;

  INSERT INTO people (gender, first, age) VALUES ('f', 'sue', 22);
  SELECT * FROM PEOPLE;

  # error values
  INSERT INTO people (gender, first, age) VALUES ('f', 'sue', 'fsd');
  INSERT INTO people (gender, first, age) VALUES ('ff', 'sue', 31);

  UPDATE people SET gender = 'f' WHERE first = 'jill';
  SELECT * FROM PEOPLE;

  INSERT INTO people (first, age) VALUES ('jill', 29);
  SELECT * FROM PEOPLE;

  UPDATE people SET age = 23 WHERE first = 'jill' and age = 22;
  SELECT * FROM PEOPLE;

  UPDATE people SET first = 'sam', gender = 'm' WHERE age = 35;
  SELECT * FROM PEOPLE;

  # be careful with delete... there's no undo!
  DELETE FROM people WHERE first = 'bob';
  SELECT * FROM PEOPLE;

  #
  | id | city       | low | high | low_recorded on | high_recorded on |
  +----+------------+-----+------+-----------------+------------------+
  | 1  | London     | -12 | 42   | 1/1/2001        | 1/1/2001    |
  +----+------------+-----+------+-----------------+------------------+

- what's an ID column for?

  CREATE TABLE weather (
    id serial8,
    city varchar(255),
    low int,
    high int,
    high_recorded_on date,
    low_recorded_on date
    );

- Once defined, altering schemas can be problematic - beware of managing existing data

  INSERT INTO weather (city, low, high, high_recorded_on) VALUES ('London', -10, 43, '1 Jan 2012')
  - repeat a couple of times - see the incrementing index

  SELECT * FROM weather;

  DROP TABLE weather;

  CREATE TABLE weather (
    id serial8 primary key,
    city varchar(255) unique not null,
    low int default 0,
    high int check (high > low),
    high_recorded_on date,
    low_recorded_on date
    );

  INSERT INTO weather (city, low, high, high_recorded_on) VALUES ('London', -10, 43, '1 Jan 2012')
  - try again, and chage values to test the constraints

  - give it valid data and run again

  SELECT * FROM weather;
  - look at the index...



- Foreign Keys

  - Discuss creating a DB to track students and their courses.
    - we need a students table - what columns
    - and a class table - what data

    - how do we link the together to track all the courses a student's enrolled on?
      - Join table with two foreign keys



  DROP DATABASE people_app;

  CREATE DATABASE campus;

- quit to terminal
  mkdir campus
  cd campus
  touch campus.sql
  subl .

--------------
- https://gist.github.com/Pavling/dc698a1e68e9b8f55706
  CREATE TABLE students
  (
    id serial4 primary key,
    first varchar(20),
    last varchar(20),
    dob date,
    gpa float4
  );

  CREATE TABLE classes
  (
    id serial4 primary key,
    name varchar(50) unique not null
  );

  CREATE TABLE schedules
  (
    id serial4 primary key,
    student_id int4 references students(id),
    class_id int4 references classes(id)
  );
-------------

  - highlight naming convention of "table_name_singular_id"

  psql -d campus -f campus.sql
  psql campus

  \d

  INSERT INTO students (first, last, dob, gpa) VALUES ('bill', 'jones', '1/1/1990', 3.1);
  INSERT INTO students (first, last, dob, gpa) VALUES ('sally', 'jones', '1/1/1950', 3.6);
  INSERT INTO students (first, last, dob, gpa) VALUES ('sue', 'smith', '1/1/2013', 2.6);
  SELECT * FROM students;

  INSERT INTO classes (name) VALUES ('Biology');
  INSERT INTO classes (name) VALUES ('Chemistry');
  INSERT INTO classes (name) VALUES ('Physics');
  SELECT * FROM classes;

  INSERT INTO schedules (student_id, class_id) VALUES (2, 3);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 1);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 2);
  SELECT * FROM schedules;

  - what if we add a student to a class that doesn't exist:
  INSERT INTO schedules (student_id, class_id) VALUES (2, 50);


  - add some extra students
  INSERT INTO schedules (student_id, class_id) VALUES (2, 3);
  INSERT INTO schedules (student_id, class_id) VALUES (2, 1);


  - How do you find out the names of the students taking Biology (class_id 1)?
    - Start by getting just the information for the Biology class.

      SELECT * FROM schedules WHERE class_id = 1;

    - We don’t really need the class_id, so we can just ask for student_id.

      SELECT student_id FROM schedules WHERE class_id = 1;

    - Now we can get the student names from the student_ids. Note that (2,3) is kind of like an array.

      SELECT first, last FROM students WHERE id in (2,3);


- Missing from notes:
  - Order By (!)
  - Where 'x' Or 'y'
  - Select Distinct
  - Joins
  - Subqueries
  - Indexes
  - normalisation

- resource:
  http://www.w3schools.com/sql/

# Facebook App - 4:30 - 5:00
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
    last varchar(20) unique not null,
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



# SQL Homework
https://github.com/Pavling/wdi-w2d1-homework

Write SQL statements that:
    1. Selects the names of all products that are not on sale.
    2. Selects the names of all products that cost less than £20.
    3. Selects the name and price of the most expensive product.
    4. Selects the name and price of the second most expensive product.
    5. Selects the name and price of the least expensive product.
    6. Selects the names and prices of all products, ordered by price in descending order.
    7. Selects the average price of all products.
    8. Selects the sum of the price of all products.
    9. Selects the sum of the price of all products whose prices is less than £20.
    10. Selects the id of the user with your name.
    11. Selects the names of all users whose names start with the letter "A".
    12. Selects the number of users whose first names are "Jonathan".
    13. Selects the number of users who want a "Teddy Bear".
    14. Selects the count of items on the wishlish of the user with your name.
    15. Selects the count and name of all products on the wishlist, ordered by count in descending order.
    16. Selects the count and name of all products that are not on sale on the wishlist, ordered by count in descending order.
    17. Inserts a user with the name "Jonathan Postel" into the users table. Ensure the created_at column is set to the current time.
    18. Selects the id of the user with the name "Jonathan Postel"?  Ensure the created_at column is set to the current time.
    19. Inserts a wishlist entry for the user with the name "Jonathan Postel" for the product "The Ruby Programming Language".
    20. Updates the name of the "Jonathan Postel" user to be "Jon Postel".
    21. Deletes the user with the name "Jon Postel".
    22. Deletes the wishlist item for the user you just deleted.

SQL statements, and results; or an app that makes it easy to step through one at a time ;-)

- Hints
  As with anything, if you get stuck, move on, then go back if you have time.
  Don't spend all night on it!
  Use the resources on w3schools, etc, to solve harder ones.



