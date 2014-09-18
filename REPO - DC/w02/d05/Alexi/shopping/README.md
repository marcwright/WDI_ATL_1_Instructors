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
     	- id, store, item, number_of_items, price, buy_date

    - The store and item names from all the receipts
      - Sears, Toys R Us, Sears, Borders, Local book store, Macy's, JC Penny
      - PS4, XBox One, TMNT Collectors Set, Lego set, Blood Meridian, Ham on Rye, The Last Tycoon, Button Down Shirt, Nikes, Tube socks, reeboks, umbrella, boxer shorts, tmnt bedspread, packers jersye, life, laptop bag

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

#### Bonus: Deliberate Review

Go over the queries you used and critically examine them, piece by piece. What does each part do?


    

