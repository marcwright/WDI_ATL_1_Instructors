## The Ruby Powered Shopping Spree

db_conn = PG.connect(dbname: 'shopping_db')
db_conn is postgres connection
.exec("PG command goes here") returns PG result object; can see inside this with .values and smart to assign this to results_array of some sort

####Background:
Early this morning, Peter Lai went on a shopping spree with a powerful new credit card. You are his accountant, and must make the appropriate changes to the `shopping_db` database using Ruby's 'pg' gem.


__Step 1:__
Go into pry.

__Step 2:__
Require the 'pg' gem

__Step 3:__
Copy and paste the following data into pry:

```Ruby
stores = ["Street Vendor", "The White House Gift Shop", "Nordstrom Rack"]

quantities = [5, 10, 15]

prices = [4.99, 9.99, 50.00, 100.00]

items = [
  "Gummy Cola Bottle",
  "Guava Candy",
  "Taco",
  "Bibimbop",
  "Burrito",
  "Channa Masala",
  "Lettuce Wrap",
  "PIZZA",
  "Cheese",
  "(Disney Soundtrack)",
  "Whiskey",
  "Athletic Socks",
  "Teach Like a Champion",
  "Practice Perfect"
]
```
__Step 4:__
Open a connection to your `shopping_db` database and store it in the variable `pg_connection`. Using this connection, add 5 purchases to the receipts table, randomly assigning a store, quantity, item, and price. The date purchased should be today's date.

pg_connection.exec("INSERT INTO receipts (store,number_of_items,item,price,buy_date) VALUES ('#{stores.sample}','#{quantities.sample}','#{items.sample}','#{prices.sample}','2014-5-5');")

  - __Hint:__ look up the `Array.sample` method.

__Step 5:__
Peter calls you and tells you he just experienced a repressed memory regarding Toys "R" Us, and wants you to delete all records having to do with Toys R Us immediately.

pg_connection.exec("DELETE FROM receipts WHERE store = 'Toys \"R\" Us'")

__Step 6:__
Peter calls you and tells you he traded in his Packers Jersey (purchased at Sears on March 23rd) for a Giants Jersey. He wants the receipts database to reflect the change.

pg_connection.exec("UPDATE receipts SET item = 'Giants Jersey' WHERE item = 'Packers Jersey';")

__Step 7:__
Peter calls yet AGAIN, and tells you Sears dropped the price of the PS4 from $400 to $350, and they gave him the discount when he threatened to write a bad yelp review. He wants the receipts table to reflect the change.

pg_connection.exec("UPDATE receipts SET price = 250.00 WHERE item = 'PS4'")

__Last Step:__  __Close your database_connection__

`pg_connection.close`



