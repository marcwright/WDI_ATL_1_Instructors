# Intro to Database Concepts

- What is a database?
- How do we talk to a database?
- What is ORM?
- What is CRUD?
- What is ACID?

## What is a Database?

A database is a piece of software designed to *efficiently* facilitate the storage and retrieval of data.

## SQL vs. NoSQL

- **SQL** (*Structured Query Language*) is:
	- Tabular data.
	- Relationships.
- **NoSQL** is:
	- Key/value pairs.
	- Non-relational.

---

### SQL Databases

A SQL database is composed of *tabular data*, and lends itself to managing data with *relationships*.

#### Common SQL databases include:

- PostgreSQL
- MySQL
- Sqlite

#### Tabular structure:

**houses**

| id | name        | color   |
|:-- |:----------- |:------- |
| 1  | Gryffindor  | Red     |
| 2  | Ravenclaw   | Purple  |
| 3  | Hufflepuff  | Yellow  |
| 4  | Slytherin   | Green   |

**A SQL query:**

```
SELECT * FROM houses WHERE color = 'Red'
```

### Object-Relational Mapping (ORM)

Many *software adaptors* exist to generate complex SQL queries for us. These adaptors provide a normalized programming interface in front of virtually any database. We'll be using ActiveRecord, which reduces SQL queries to basic Ruby code:

```
House.find_where(color: "Red")
```

---

### NoSQL Databases

A NoSQL database stores data as a collection of documents, normally formatting data as key/value pairs.

#### Common NoSQL databases:

- MongoDB
- CouchDB

#### Schema Structure:

**houses**

```
[{
	"_id": {"$oid": "86bddb67fb996e905cc8f062a6ec6dad"},
	"name": "Gryffindor",
	"color": "Red"
},
{
	"_id": {"$oid": "5e0c6f075a2fd3e5a1f541b8fec94834"},
	"name": "Ravenclaw",
	"color": "Purple"
},
{
	"_id": {"$oid": "0f700f432868dac46d4e4539399972f3"},
	"name": "Hufflepuff",
	"color": "Yellow"
},
{
	"_id": {"$oid": "4bd058f62e145be86958de80ff1a2a8a"},
	"name": "Slytherin",
	"color": "Green"
}]
```

**A NoSQL Query:**

```
db.houses.find({ color: "Red" })
```

## Relational Data

Within a relational database, all database records (rows) are assigned an ID, or *primary key*. Records may then reference other *foreign keys* (keys from other tables) to create relationships between records.

**houses**

| id | name        | color   |
|:-- |:----------- |:------- |
| 1  | Gryffindor  | Red     |
| 2  | Ravenclaw   | Purple  |
| 3  | Hufflepuff  | Yellow  |
| 4  | Slytherin   | Green   |

---

**students**

| id | first_name | last_name | house |
|:-- |:---------- |:--------- |:----- |
| 1  | Harry      | Potter    | 1     |
| 2  | Ron        | Weasly    | 1     |
| 3  | Hermionie  | Granger   | 1     |
| 4  | Draco      | Malfoy    | 4     |

*(each student has a foreign-key relationship to a house)*

---

**subjects**

| id | subjects                      |
|:-- |:----------------------------- |
| 1  | Charms                        |
| 2  | Potions                       |
| 3  | Herbology                     |
| 4  | Defense Against the Dark Arts |
| 5  | Quiddich                      |

---

**rel_students_subjects**

| id | student_id | subject_id |
|:-- |:---------- |:---------- |
| 1  | 1          | 4          |
| 2  | 3          | 1          |
| 3  | 3          | 2          |
| 4  | 1          | 5          |
| 5  | 2          | 5          |


*(a relationship table maps many students to many subjects)*

## CRUD

The basic operations for managing database records:

- **Create** -- Creates a new record.
- **Read** -- Reads an existing record.
- **Update** -- Updates an existing record.
- **Destroy** -- Deletes an existing record, and *may* cascade on to delete all related records.


## ACID

A system for guarenteeing database transactions and integrity:

- Atomicity
- Consistency
- Isolation
- Durability

**Consider the transfer of funds between two bank accounts…**

- **Atomicity** guarentees that all transactions either succeed together, or fail together. *ie: one account isn't debited without the other being credited.*

- **Consistency** guarentees that all transactions abide by the rules of the database. *ie: transactions that would take an account below zero must be preemptively aborted.*

- **Isolation** guarentees that transactions are never seen in an intermediary state. *ie: the debit transaction is never reported until the credit has also resolved.*

- **Durability** guarantees that all confirmed transactions are recorded and thus reproducible in the event of a system failure.

## The Postgres Console

__Let's open up the postgres console__

`psql`

__Okay. Awesome. Now what? Let's list all the tables in the wdi database__

`\l`

__We don't have any databases to list. So let's create a database.__ 

`CREATE DATABASE jedi_academy;`

__Okay, great. We've got a database. But we need to connect to it. The syntax is:__

`\c database_name;`

__Our database is `jedi_academy`, so how do we connect to it?__ 

`\c jedi_academy`

 __Wonderful. Now we're connected to the `jedi_academy` database. Let's check its tables.__

 `\d`

 __Ruh roh, what's a database without tables? Let's create one. What do we need?__

```SQL
CREATE TABLE padawans (
  id                serial       PRIMARY KEY, 
  name              varchar(50)  NOT NULL,
  img_url           varchar(255) UNIQUE,
  years_training    integer      NOT NULL,
  podracer          boolean      NOT NULL
);
```
###Dissection of the Above
- `CREATE TABLE`
- `table_name`
- Attributes (`id`, `name`, `img_url`, `age`, `likes_dc`)
- Datatypes (`serial`, `varchar`(string), `integer`, `boolean`)
- Constraints (`PRIMARY KEY`, `NOT NULL`, `UNIQUE`)
- What's a primary key?
  - A primary key is a unique, not-null value used to identify records in a database table. (Note that a unique constraint does not, by itself, provide a unique identifier because it does not exclude null values.) We use the `serial` datatype, which is an auto-incrementing integer.
- What's a datatype serial?
  A primary key constraint is just a combination of the `NOT NULL` and `UNIQUE` constraints. We use this a column can be used as a unique identifier for entries in the table. (This is a direct consequence of the definition of a primary key. (Note that a unique constraint does not, by itself, provide a unique identifier because it does not exclude null values.) This is useful both for documentation purposes and for client applications. For example, a GUI application that allows modifying row values probably needs to know the primary key of a table to be able to identify rows uniquely.
 
- What's a serial?
  - Serial means auto-incrementing. It's a value determined by a simple function. Database management systems keep track of the highest assigned number. 
- What's a foreign key?
  - A foreign key constraint specifies that the values in a column (or a group of columns) must match the values appearing in some row of another table. We say this maintains the referential integrity between two related tables.

- __Uh oh, we need to add a column to our database__
  - `ALTER TABLE students ADD COLUMN age integer;`
- __How do we get rid of a column? The same way we get rid of anything in SQL. By dropping it.__
  - `ALTER TABLE students DROP COLUMN age;`

- __How do we add entries to a table? In the following tedious order__
  - `INSERT INTO students (name, age) VALUES ('Travis', 27);`

- __How do we remove entries from a table?__
  - `DELETE FROM students WHERE age = 27;`      


Say you have the product table that we have used several times already:

```SQL
CREATE TABLE fridges (
  id serial PRIMARY KEY, 
  location varchar(50) NOT NULL,
  brand varchar(50) NOT NULL,
  size integer NOT NULL
);

CREATE TABLE foods (
  id serial PRIMARY KEY, 
  name varchar(50) NOT NULL,
  is_vegan boolean,
  enter_time timestamp,
  fridge_id integer REFERENCES fridges(id)
);

CREATE TABLE drinks (
  id serial PRIMARY KEY, 
  name varchar(50) NOT NULL,
  size integer NOT NULL,
  is_alcoholic boolean,
  fridge_id integer REFERENCES fridges(id)
);
```

__How do we get rid of a sillily named database?__

`DROP DATABASE marpers;`

- `\c database_name`: connects you to `database_name`
- `\d` lists all tables of current database
- `\q` : quits the console.

## SQL QUERY DISSECTION
- `SELECT <attributes> FROM <table_name>;` 

### DATABASES & SQL

- Concepts:
  - Describe the parts of a schema (ie, an ERD): entities, attributes and relationships (Peter's got this)
  - Explain what a foreign key is and why you would use one (ask greg if he plans to cover this when talking bout relational dbs)
  - Explain what a constraint is
  - Explain what a join is and when you would use one
- Mechanisms:
  - Design a database schema
  - Write basic SQL queries:
    - UPDATE
    - DELETE
  - Use SQL to structure your database
    - ALTER TABLE
      - Add, remove and alter columns in a database
  - Modify SQL queries using WHERE
  - Connect a Ruby program to a database and run queries to both save and retrieve information

### MENTAL MODELS FOR COMPUTING

- Concepts:
  - Explain what the client-server model is.
  - Name the four basic actions underlying a client-server relationship (CRUD).
  - List the ways in which CRUD relationships are enacted using HTTP and SQL.


## LESSON

* Draw a table on the board, label the parts, show INSERTs and SELECTs
* Discuss CRUD and client-server.

####SQL Commands

**DELETE**: always uses **WHERE** clauses!

```SQL
DELETE FROM tablename …
```

**UPDATE**: usually uses **WHERE** clauses

```SQL
UPDATE tablename SET attr = value …
```

####Schema Commands

**[ALTER TABLE](http://www.postgresql.org/docs/9.1/static/sql-altertable.html)**: change the schema that describes the table

```SQL
ALTER TABLE receipts ADD COLUMN parent varchar(50);
```


####Interacting with your database from Ruby

**Step 1:** install PostgreSQL gem from the command line

* `gem install pg`

**Step 2:** start pry from the command line (`pry`), and create a PostgreSQL connection

```Ruby
require "pg"
db_conn = PG.connect( dbname: "receipts_db" )
```

**Step 3:** run the same select query from above

```Ruby
result = db_conn.exec( "SELECT * FROM receipts" )
result.values
```

**Step 4:** run another insertion query

```Ruby
query = "INSERT INTO receipts (store, item, number_of_item, price, buy_date) "
query += "VALUES ('Macy''s', 'pink Izod top', 3, 28.50, 'December 22 1988');"
db_conn.exec( query )
```

* what's the deal with all of the quotes?!

**Step 5:** run a selection query to test our input…

```Ruby
result = db_conn.exec( "SELECT * FROM receipts" )
result.values
result.each {|row| puts row}
```

* You can find out more about what you can do with the results of a pg gem selection query with the [pg documentation](http://deveiate.org/code/pg/PG/Result.html)

**Step 6:** what do we do next?

```Ruby
db_conn.close # ALWAYS CLOSE YOUR CONNECTIONS!!!
```

####Wrap-up

* We now can see how to:
   * use a DBMS to create a database, and then add a table to the database
   * interact with the database thru a command-line tool (`psql`)
   * interact with the database thru the `pg` Ruby gem
   * run two types of queries:
      * INSERT (aka Create, aka POST): add an element to a table
      * SELECT (aka Read, aka GET): get one or more elements from a table
* Next, we will:
   * interact with the database from a program
   * work with more complex INSERTs and SELECTs


####Using pg (the PostgreSQL Ruby gem)

Let's open up the command-line receipt app, and change it from using file I/O to using a database as a persistent store:

**Step 1:** Copy to your week-day-name directory (or open) the folder *receipt_cmd*

* run thru it a few times using `ruby main_receipts.rb` to test

**Step 2:** Open the file *main_receipts.rb*

* add `require "pg"`
* replace the file I/O with database queries
