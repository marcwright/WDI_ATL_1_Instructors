# Domain Modeling

Beneath every web application is a database. This database manages *tables* and *schemas* that store the application's data. The structure of a database is specific to the business requirements of the *application domain*.

Looking at existing web applications is a great way to think about how to structure your own!

## Excercise

We'll be looking at a few web applications. We want to compose a tangible database schema for each application.

1. Break into pairs.
* Spend 10 minutes reviewing the application. Consider what it does.
* Compose an ERD mapping entities, their attributes, and their relationships.
* When you feel your ERD is complete, circulate the room and see what other groups have. See if another group found something that you missed.
* Create a new `.sql` file for the application. Compose SQL that would build all database tables with their attributes and relationships defined. Define attribute datatypes, defaults, and constraints where appropriate.

### Bonus...

* If you have additional time, compose SQL at the bottom of the document that would create a database record for each table that you've defined. 