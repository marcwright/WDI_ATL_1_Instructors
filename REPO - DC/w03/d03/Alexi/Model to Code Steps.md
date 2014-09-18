Quick overview of what I think we've been doing for the last couple of days:

	The follwing steps are similar to the basic apps we've been building previously, however, these steps specifically are geared towards building out the Model first (the 'M' in MVC - Model/View/Controller).

**Problem given**: "build me an app to solve a problem:" 

1. List attributes and entities
2. Draw ERD
3. Create table schema (SQL file)
4. Create database (PostgreSQL, psql)
5. Load schema/tables (SQL) into Postgres to populate database 
	- psql -d name_db -f file.sql (or copy/paste into 'psql')
6. ActiveRecord: define entities and their relationships (in a .rb file)
	- Association Basics --> [link](http://guides.rubyonrails.org/association_basics.html) 
7. Write tests (in a 'spec' file) to validate the app's ability to communicate with the database (ThoughtBot)
	- Shoulda Matchers --> [link](https://github.com/thoughtbot/shoulda-matchers)
8. Make tests pass with validations through Active Record
	- Active Record Validations --> [link](http://guides.rubyonrails.org/active_record_validations.html)
9. Write tests to validate the behavior of our app
10. Write classes and methods (objects) to pass the tests
  

			Did I miss anything?