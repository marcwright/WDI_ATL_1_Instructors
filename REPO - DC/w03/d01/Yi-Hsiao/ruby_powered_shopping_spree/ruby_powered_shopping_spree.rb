require "pg"

receipt_table = "receipts"
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

pg_connection = PG.connect(dbname: "shopping_db")

# Open a connection to your `shopping_db` database and store it in the variable `pg_connection`. Using this connection, add 5 purchases to the receipts table, randomly assigning a store, quantity, item, and price. The date purchased should be today's date.
purchase_statement = "INSERT INTO #{receipt_table} (store, number_of_items, item, price) VALUES "
values_placeholder = 5.times.map do |iteration|
  base = iteration * 4
  "($#{ base + 1 }, $#{ base + 2 }, $#{ base + 3 }, $#{ base + 4 })"
end
purchase_statement << values_placeholder.join(",")
insert_values = 5.times.map { |iteration| [stores.sample, quantities.sample, items.sample, prices.sample] }.flatten
pg_connection.exec_params(purchase_statement, insert_values)

# Peter calls you and tells you he just experienced a repressed memory regarding Toys "R" Us, and wants you to delete all records having to do with Toys R Us immediately.
pg_connection.exec("DELETE FROM #{receipt_table} WHERE store = 'Toys \"R\" Us'")

# Peter calls you and tells you he traded in his Packers Jersey (purchased at Sears on March 23rd) for a Giants Jersey. He wants the receipts database to reflect the change.
return_item("SELECT id FROM #{receipt_table} WHERE item = 'Packers Jersey' AND store = 'Sears'", )
returned_record_id = pg_connection.exec().getvalue(0, 0)
pg_connection.exec_params("UPDATE #{receipt_table} SET item = $1 WHERE id = $2", ["Giants Jersey", returned_record_id])

# Peter calls yet AGAIN, and tells you Sears dropped the price of the PS4 from $400 to $350, and they gave him the discount when he threatened to write a bad yelp review. He wants the receipts table to reflect the change.
returned_record_id = pg_connection.exec("SELECT id FROM #{receipt_table} WHERE item = 'PS4' and store = 'Sears'").getvalue(0, 0)
pg_connection.exec_params("UPDATE #{receipt_table} SET price = $1 WHERE id = $2", [350, returned_record_id])

# __Last Step:__  __Close your database_connection__
pg_connection.close
