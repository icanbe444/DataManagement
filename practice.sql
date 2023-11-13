USE QVAN_2213884;

/* 
Select statement using TOP, DISTINCT,COUNT, AS, MAX, MIN, AVG

*/


SELECT TOP 5 * FROM Customer;

SELECT DISTINCT(customer_id) FROM Customer;

SELECT COUNT(cust_name) AS "Customer Name" FROM Customer;
 

SELECT * FROM Driver;
SELECT * FROM Invoice;

SELECT MAX(amount) FROM Invoice;

SELECT AVG(amount) FROM Invoice;

SELECT * FROM QVAN_2213884.dbo.Customer;

SELECT * FROM Customer WHERE cust_name IN ('Chopsticks', 'Smith');

SELECT * FROM Customer ORDER BY 2;

SELECT Customer.cust_name AS 'CUSTOMER NAME', Invoice.amount 
AS 'AMOUNT', Invoice.paid 
AS 'PAYMENT STATUS', Invoice.invoice_date AS 'DATE'
FROM Customer INNER JOIN Invoice ON Customer.customer_id = Invoice.customer_id;

SELECT * FROM Customer INNER JOIN Invoice ON Customer.customer_id = Invoice.customer_id;

/*FULL OUTER JOIN WILL SHOW EVERYTHING IN BOTH TABLES 
INNER JOIN WILL SHOW MATCHING COLUMNS IN THE TWO TABLES

*/

SELECT Customer.cust_name AS 'CUSTOMER NAME', Invoice.amount 
AS 'AMOUNT', Invoice.paid 
AS 'PAYMENT STATUS', Invoice.invoice_date AS 'DATE'
FROM Customer FULL OUTER JOIN Invoice ON Customer.customer_id = Invoice.customer_id; 


/*
LEFT OUTER JOIN TAKES EVERYTHING IN THE LEFT TABLE AND EVERYTHING THAT IS OVERLAPPING BUT IF ITS ONLY IN TH RIGHT
TABLE WE DO NOT WANT IT. THE LEFT TABLE IS THE FIRST TABLE IN THE QUERY
*/

SELECT Customer.cust_name AS 'CUSTOMER NAME', Invoice.amount 
AS 'AMOUNT', Invoice.paid 
AS 'PAYMENT STATUS', Invoice.invoice_date AS 'DATE'
FROM Customer LEFT OUTER JOIN Invoice ON Customer.customer_id = Invoice.customer_id; 

/*
RIGHT OUTER JOIN TAKES EVERYTHING IN THE LEFT TABLE AND EVERYTHING THAT IS OVERLAPPING BUT IF ITS ONLY IN TH RIGHT
TABLE WE DO NOT WANT IT. THE LEFT TABLE IS THE FIRST TABLE IN THE QUERY
*/

SELECT Customer.cust_name AS 'CUSTOMER NAME', Invoice.amount 
AS 'AMOUNT', Invoice.paid 
AS 'PAYMENT STATUS', Invoice.invoice_date AS 'DATE'
FROM Customer RIGHT OUTER JOIN Invoice ON Customer.customer_id = Invoice.customer_id; 



