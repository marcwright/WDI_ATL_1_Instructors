##Interacting with your database from Ruby

####Framing:
So we've done some CRUD in the postgres command line interface. Now let's get into interacting with the database via Ruby.

####Step 1: install PostgreSQL gem from the command line

`gem install pg`

####Step 2: start pry from the command line (pry), and create a PostgreSQL connection

```ruby 
require "pg"
 
db_conn = PG.connect(dbname: "shopping_db")
```
Now that we've established a connection with the db, we can execute SQL queries using the `.exec` method.

####Step 3: ...With that in mind, let's take a look at the results from Friday's shopping exercise

```Ruby 
result = db_conn.exec( "SELECT * FROM receipts" )

array_of_entries = result.values # => an array of arrays, each sub-array representing an entry in the receipts table
```

####Step 4: run another insertion query

```Ruby 
query = "INSERT INTO receipts (store, item, number_of_items, price, buy_date) "
query += "VALUES ('Disney Store', 'Frozen T-Shirt', 1, 35.00, 'May 4 2014');"

db_conn.exec( query )
```

what's the deal with all of the quotes?!

To use single quotes with POSTGRES, you have to use its unique escape character, which happens to be a single quote/apostrophe. 

####Step 5: run a selection query to test our input…

```Ruby 
result = db_conn.exec( "SELECT * FROM receipts" ) 
result.values 
result.values.each { |row| puts "Peter bought #{row[3]} #{row[2]}(s) for #{row[4]} each on #{row[5]}" }
```

####Step 6: close your connection!
```Ruby 
db_conn.close # ALWAYS CLOSE YOUR CONNECTIONS!!!
```

## STUDENTS DO THE RUBY POWERED SHOPPING SPREE EXERCISE 


