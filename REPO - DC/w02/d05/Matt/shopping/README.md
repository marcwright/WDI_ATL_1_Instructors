##Peter Lai's 2014 Purchase History

#### Setup:

- Enter the postgres console and create a database called `shopping_db`
- Quit the postgres console, __cd into your "shopping" directory__, and enter the following line in the terminal:
  - `psql -d shopping_db -f seeds.sql`
  - __NOTE:__ You will have to be within your your `shopping` directory.

<<<<<<< HEAD
- Great, now head back into the postgres console and connect to `shopping_db`. You should have a table called `receipts`. Take a look at the
=======
- Great, now head back into the postgres console and connect to `shopping_db`. You should have a table called `receipts`. Take a look at the 
>>>>>>> 1de716994798b48ce3455e1f2fc3235b18438453

#### SQL Queries
- Your task is to mine the receipts table for the following data, documenting the queries you used in the empty bullet points provided:
    - All the attributes from all the receipts
<<<<<<< HEAD
      - SELECT * FROM receipts;

    - The store and item names from all the receipts
      - SELECT store,item FROM receipts;

    - All the attributes from all purchases made at Toys R Us
      - SELECT * FROM receipts WHERE store = 'Toys R Us';

    - The item name of all the purchases made at Borders.
      - SELECT item FROM receipts WHERE store = 'Borders';

    - The total number of items purchased
      - SELECT SUM(number_of_items) FROM receipts;

    - The total number of items purchased at Sears
      - SELECT SUM(number_of_items) FROM receipts WHERE store = 'JC Penny';

    - The total amount of money spent at Sears
      - __Note:__ Price is the price of a single item, not the total cost of, say, 2 or 3 shirts
      - SELECT SUM(number_of_items * price) FROM receipts WHERE store = 'Sears';

    - The average number of items purchased on a trip to JC Penny
      - SELECT AVG(number_of_items) FROM receipts WHERE store = 'JC Penny';
=======
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
>>>>>>> 1de716994798b48ce3455e1f2fc3235b18438453

#### Bonus: Deliberate Review

Go over the queries you used and critically examine them, piece by piece. What does each part do?


<<<<<<< HEAD

=======
    
>>>>>>> 1de716994798b48ce3455e1f2fc3235b18438453

