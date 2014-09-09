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
