# Databases

## What is a database?

  - Types of databases
    - SQL / NoSQL
    - Relational / Document
    - Note that a 'relation' is a view of data that comes back from a query, not the fact that there are relationships
  - What do we store in databases
  - How do we manipulate data in databases?
    - Create
    - Read
    - Update
    - Delete


## PostgreSQL

```
    which psql
```

If there are any issues with running `psql`, ensure that the `postgresapp` is installed and running (it should have been configured in installfest), and that the path is updated to include it - /Applications/Postgres93.app/Contents/MacOS/bin (but launch `psql` from the system icon, and note the path used)


```
  psql
  \q -- to quit
```

## CRUD

To work with data in databases we perform the four CRUD operations. So we'll work through the SQL commands that give us that functionality.


In psql:

```
    create database people_app;
    \l 
    \c people_app
    \d
    create table people (
      name varchar(255),
      age int2,
      sex char(1)
      );
    \d
    \d people

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
```


## What's an ID column for?

```
    CREATE TABLE weathers (
      id serial8,
      city varchar(255),
      low int,
      high int,
      high_recorded_on date,
      low_recorded_on date
      );
```


Once defined, altering schemas can be problematic - beware of managing existing data.

```
  INSERT INTO weathers (city, low, high, high_recorded_on) VALUES ('London', -10, 43, '1 Jan 2012')
```

Repeat the INSERT a couple of times - see the incrementing index

```
    SELECT * FROM weathers;

    DROP TABLE weathers;

    CREATE TABLE weathers (
      id serial8 primary key,
      city varchar(255) unique not null,
      low int default 0,
      high int check (high > low),
      high_recorded_on date,
      low_recorded_on date
      );

    INSERT INTO weathers (city, low, high, high_recorded_on) VALUES ('London', -10, 43, '1 Jan 2012')
```

Try again, and chage values to test the constraints

Give it valid data and run again

```
  SELECT * FROM weathers;
```

Look at the index... what's noteable? 

It should be that there's a gap in the numbering - the records that failed constraints still used up numbers in the sequence.


# Foreign Keys

Let's create a DB to track students and their courses.

  - we need a students table - what columns?
  - and a class table - what data?
  - how do we link the together to track all the courses a student's enrolled on?
    - Join table with two foreign keys

```
    DROP DATABASE people_app;

    CREATE DATABASE campus;
```

In the terminal

```
    mkdir campus
    cd campus
    touch campus.sql
    subl .
```

```
    -- https://gist.github.com/Pavling/dc698a1e68e9b8f55706
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
```

The fields in the join-table are generally named according to the convention "table_name_singular_id".


```
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
```

What if we add a student to a class that doesn't exist:

```
    INSERT INTO schedules (student_id, class_id) VALUES (2, 50);
```

Add some extra students

```
    INSERT INTO schedules (student_id, class_id) VALUES (2, 3);
    INSERT INTO schedules (student_id, class_id) VALUES (2, 1);
```

How do you find out the names of the students taking Biology (class_id 1)?

```
    -- Start by getting just the information for the Biology class.
    SELECT * FROM schedules WHERE class_id = 1;

    -- We don’t really need the class_id, so we can just ask for student_id.
    SELECT student_id FROM schedules WHERE class_id = 1;

    -- Now we can get the student names from the student_ids. Note that (2,3) is kind of like an array.
    SELECT first, last FROM students WHERE id IN (2,3);
```

Topics not covered today, which might be of use to research:

  - Order by (a very useful tool)
  - Where 'x' or 'y'
  - Select distinct
  - Joins (especially in the homework tonight!)
  - Subqueries
  - Indexes
  - Normalisation

Resource:

  - http://www.w3schools.com/sql/

