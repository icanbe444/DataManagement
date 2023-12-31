use QVAN_2213884;

SELECT Driver.driver_id, firstname, lastname, vehicle FROM Driver, Deliver
WHERE Driver.driver_id = Deliver.driver_id;

SELECT Driver.driver_id, firstname, lastname, Deliver.vehicle 
FROM Driver INNER JOIN Deliver 
ON Driver.driver_id = Deliver.driver_id;


SELECT L.delivery_id, D.driver_id, firstname, lastname, vehicle, C.cust_name
FROM Deliver L, Driver D, Customer C
WHERE L.driver_id = D.driver_id and L.customer_id = L.customer_id;


SELECT L.delivery_id, D.driver_id, firstname, lastname,
 cust_name, vehicle
FROM Customer C, Driver D, Deliver L WHERE D.driver_id = L.driver_id
AND C.customer_id = L.customer_id;
SELECT * FROM Driver;
SELECT delivery_id, customer_id, Driver.firstname FROM Deliver, Driver 
WHERE Driver.firstname LIKE ('%Q%') or  Driver.firstname LIKE  ('%EL%');

/*2.2.2	List the customer names and pickup dates of all deliveries made 
by the driver “QuickVan Winkle” in 1995 
(Hint: treat the date as a string, and use Like)..
*/
SELECT * FROM Deliver;
SELECT C.cust_name, L.pickup_date, D.firstname, D.lastname FROM Deliver L, Customer C, Driver D
WHERE D.firstname = 'QuickVan' and D.lastname = 'Winkle'  and L.pickup_date LIKE '%1995%';

SELECT C.cust_name, L.pickup_date, CONCAT(D.firstname, ' ', D.lastname) AS full_name
FROM Deliver L, Customer C, Driver D
WHERE C.customer_id = L.customer_id
AND D.driver_id = L.driver_id
AND L.pickup_date LIKE '%1995%'

/*2.2.3	List the delivery addresses of all deliveries 
made to customer “Chopsticks” at the express rate. LATER modified to specify cetain date range*/

SELECT C.cust_name, L.del_address, L.del_date FROM Deliver L, Customer C
WHERE C.cust_name = 'Chopsticks' and L.del_date BETWEEN '1995-11-10' AND'1995-12-29';

SELECT C.cust_name, L.del_address, L.del_date FROM Deliver L, Customer C
WHERE C.cust_name = 'Chopsticks' and L.del_date BETWEEN '1995' AND'1997';

/*2.2.4	list the delivery IDs, driver IDs, driver surnames, customer names and 
vehicles of all deliveries that were made in vehicles with a registration starting with “M”.*/
SELECT *FROM Deliver;
SELECT Customer.cust_name, Deliver.delivery_id, Driver.driver_id, Driver.lastname, Deliver.vehicle
FROM Customer, Driver, Deliver
WHERE Deliver.vehicle like 'M%';



SELECT driver_id, SUM((0.20 * distance) + (0.02 * weight)) AS Total_Earned FROM Deliver
WHERE driver_id = 'D020' GROUP BY driver_id;


SELECT driver_id, SUM(0.20 * distance + 0.02 * weight) AS Total_Earned FROM Deliver
WHERE driver_id = 'D020' GROUP BY driver_id;

SELECT firstname,  COUNT(*) AS Delivery_Done 
FROM Driver GROUP BY  firstname; 

SELECT driver_id, COUNT(*) AS deliveries_done FROM Deliver
GROUP BY driver_id;

SELECT * FROM Driver;
SELECT * FROM Payslip

/*2.4.1	List driver IDs, firstname and lastname together with the total amount earned by each driver. Hint you 
will need to join Deliver and Driver in order to obtain the firstname and lastname.*/

SELECT D.driver_id, D.firstname, D.lastname, P.amount FROM Driver D, Deliver L, Payslip P
WHERE D.driver_id =  P.driver_id
GROUP BY D.driver_id, D.firstname, D.lastname, D.firstname,P.amount;

SELECT D.driver_id, D.firstname, D.lastname, P.amount FROM Driver D, Deliver L, Payslip P
WHERE D.driver_id =  P.driver_id;

/*2.4.3	Modify your answer from 2.4.2 to list the 
average amount paid to drivers from the Payslip tablee*/

SELECT D.driver_id, AVG(P.amount) AS Averge_Salary
FROM Driver D, Payslip P WHERE D.driver_id =  P.driver_id 
GROUP BY D.driver_id;


/*2.4.4	List all the customers and the number of invoices sent to them from the Invoice table*/
SELECT * FROM Customer;
SELECT * FROM Deliver;


SELECT Customer.customer_id, Customer.cust_name, Customer.cust_address, 
COUNT(Invoice.invoice_id) AS Number_of_Invoice FROM Customer, Invoice
WHERE Customer.cust_address IS NOT NULL 
GROUP BY  Customer.customer_id, Customer.cust_name,  Customer.cust_address;

/*2.4.5	Output the total distance and average distance covered by all deliveries in the deliver table.*/
SELECT SUM(Deliver.distance), ROUND(AVG(Deliver.distance),2) AS Average_Distance_Covered
FROM Deliver;

SELECT SUM(Deliver.distance) AS Total_Distance_Covered, 
       ROUND(AVG(Deliver.distance), 2) AS Average_Distance_Covered
FROM Deliver;





