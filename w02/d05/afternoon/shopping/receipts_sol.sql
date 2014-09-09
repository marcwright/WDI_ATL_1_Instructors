SELECT * FROM receipts;
SELECT store, item FROM receipts;
SELECT * FROM receipts WHERE store = 'Toys R Us';
SELECT item FROM receipts WHERE store = 'Borders';

SELECT SUM(number_of_items) FROM receipts;
SELECT SUM(number_of_items) FROM receipts WHERE store = 'Sears';
SELECT SUM(number_of_items) FROM receipts WHERE
SELECT DISTINCT store FROM receipts;

SELECT SUM(number_of_items*price) FROM receipts WHERE store='Sears';
