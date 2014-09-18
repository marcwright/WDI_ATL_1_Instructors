## The Postgres Console

### Intro to PSQL

Framing: We're going to spend the afternoon working in the postgres console.

__Let's open up the postgres console__

`psql`

__Okay. Awesome. Now what? Let's list your databases__

`\l`

__We don't have any databases to list. So let's create a database.__ 

`CREATE DATABASE wdi;`

__Okay, great. We've got a database. But we need to connect to it. The syntax is:__

`\c database_name;`

__Our database is `wdi`, so how do we connect to it?__ 

`\c wdi`

 __Wonderful. Now we're connected to the `wdi` database. Let's check its tables.__

 `\d`

 __Ruh roh, what's a database without tables? Let's create one. But what do we need?__

 ## Dissection of Padawans

```SQL
CREATE TABLE students (
  id   SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age  INTEGER NOT NULL,
  ss   VARCHAR(13) UNIQUE
);
```

FIRST, touch on SEMICOLONS. 
###Dissection of the Above
- `CREATE TABLE`
- `table_name`
- Attributes (`id`, `name`, `age`)
- Datatypes (`serial`, `varchar`(string), `integer`, `boolean`)
- Constraints (`PRIMARY KEY`, `NOT NULL`, `UNIQUE`)
- What's a primary key?
  - A primary key is a unique, not-null value used to identify records in a database table. (Note that a unique constraint does not, by itself, provide a unique identifier because it does not exclude null values.) We use the `serial` datatype, which is an auto-incrementing integer.
- What's a datatype serial?
  A primary key constraint is just a combination of the `NOT NULL` and `UNIQUE` constraints. We use this a column can be used as a unique identifier for entries in the table. (This is a direct consequence of the definition of a primary key. (Note that a unique constraint does not, by itself, provide a unique identifier because it does not exclude null values.)
 
- What's a serial?
  - Serial means auto-incrementing. It's a value determined by a simple function. Database management systems keep track of the highest assigned number. 
- What's a foreign key?
  - A foreign key constraint specifies that the values in a column (or a group of columns) must match the values appearing in some row of another table. We say this maintains the referential integrity between two related tables.

# Schema Exercise

- __Uh oh, we need to add a column to our database__
  - `ALTER TABLE students ADD COLUMN ss VARCHAR(13) UNIQUE;`
- __Wait, does GA need to know your soc? How do we get rid of a column? The same way we get rid of anything in SQL. By dropping it.__
  - `ALTER TABLE students DROP COLUMN ss;`

# Okay, so we made some tables. 

- __How do we add entries to a table? In the following tedious order__
  - `INSERT INTO students (name, age) VALUES ('Travis', 27);`

- __How do we remove entries from a table?__
  - `DELETE FROM students WHERE age = 27;`

## SQL QUERY DISSECTION WITH JEDI_ACADEMY
- `SELECT <attributes> FROM <table_name> WHERE <attribute_name> = <desired_code>;` 




