##Peter Lai's 2014 Purchase History

#### Setup:

- Enter the postgres console and create a database called `shopping_db`
- Quit the postgres console, __cd into your "shopping" directory__, and enter the following line in the terminal:
  - `psql -d shopping_db -f seeds.sql`
  - __NOTE:__ You will have to be within your your `shopping` directory.

- Great, now head back into the postgres console and connect to `shopping_db`. You should have a table called `receipts`. Take a look at the 

#### SQL Queries
- Your task is to mine the receipts table for the following data, documenting the queries you used in the empty bullet points provided:
    - All the attributes from all the receipts
<<<<<<< HEAD
      - 

    - The store and item names from all the receipts
      - 

    - All the attributes from all purchases made at Toys R Us
      - 

    - The item name of all the purchases made at Borders.
      - 

    - The total number of items purchased
      - 

    - The total number of items purchased at Sears
      - 

    - The total amount of money spent at Sears
      - __Note:__ Price is the price of a single item, not the total cost of, say, 2 or 3 shirts

    - The average number of items purchased on a trip to JC Penny
      - 
=======
      - `select * from receipts;`

    - The store and item names from all the receipts
      - `select store, item from receipts;`

    - All the attributes from all purchases made at Toys R Us
      - `select * from receipts where store = 'Toys R Us';`

    - The item name of all the purchases made at Borders.
      - `select * from receipts where store = 'Borders';`

    - The total number of items purchased
      - `select sum(number_of_items) from receipts;`

    - The total number of items purchased at Sears
      - `select sum(number_of_items) from receipts where store = 'Sears';`

    - The total amount of money spent at Sears
      - __Note:__ Price is the price of a single item, not the total cost of, say, 2 or 3 shirts
      - `select sum(number_of_items * price) from receipts where store = 'Sears';`

    - The average number of items purchased on a trip to JC Penny
      - `select avg(number_of_items) from receipts where store = 'JC Penny';`
>>>>>>> 1de716994798b48ce3455e1f2fc3235b18438453

#### Bonus: Deliberate Review

Go over the queries you used and critically examine them, piece by piece. What does each part do?


    

