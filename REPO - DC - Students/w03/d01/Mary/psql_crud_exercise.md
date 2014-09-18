## Peter Lai Shops On...

UPDATE table_name SET column_name = 'new_value'
WHERE column_name = 'reference'

DELETE FROM table_name WHERE column_name = 'value'

 ####Prompt:
Peter Lai continues to shop. Your task is to make the appropriate updates to his receipts table:

1. Yesterday, he purchased 3 Batman shirts (at $20.00 a pop) from Target.
INSERT INTO receipts (store, number_of_items, item, price, buy_date) VALUES('Target',3,'Batman Shirts','$20.00','2014-5-4');

2. Peter returned 'The Last Tycoon' to the local bookstore, and the store kindly refunded his card, so the purchase price should be updated to $0.00.
UPDATE receipts SET price = 0 WHERE item = 'The Last Tycoon';

3. Add a 'returned' column onto the receipts table. It should take a boolean value and default to `false`.
ALTER TABLE receipts ADD COLUMN returned BOOLEAN DEFAULT (FALSE);
  - Update the 'returned' value for 'The Last Tycoon' to true.
  UPDATE receipts SET returned = 'true' WHERE item = 'The Last Tycoon';

4. Looks like Peter mis-typed JC Penney while inputting his receipts (he forgot the second 'E'). Make sure the store's spelling is correct for all relevant entries in the receipts table.
UPDATE receipts SET store = 'JC Penney' WHERE store = 'JC Penny';

5. Technically, the __R__ in __Toys R Us__ should be surrounded by double quotes. Update all relevant entries with the proper spelling of Toys "R" Us.
UPDATE receipts SET store = 'Toys "R" Us' WHERE store = 'Toys R Us';

6. Peter is embarrassed about his Teenage Mutant Ninja Turtles bedspread and wants the purchase stricken from the receipts table. Indulge him.
DELETE FROM receipts WHERE item = 'TMNT bedspread';





