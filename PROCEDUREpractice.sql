USE QVAN_2213884;

EXECUTE sp_tables;

SELECT * FROM Deliver;

SELECT DATEDIFF(minute, pickup_date, del_date) AS 'Delivery Time' FROM Deliver;

SELECT  Driver.driver_id,COUNT(Deliver.delivery_id) AS DeliveryCount,
CONCAT(Driver.firstname, ' ', Driver.lastname) AS DriverFullName,
DATEDIFF(MINUTE, pickup_date, del_date) AS 'Delivery Time'
FROM Deliver
JOIN Driver ON Driver.driver_id = Deliver.driver_id
GROUP BY Driver.lastname, Driver.firstname, pickup_date, del_date,  Driver.driver_id;

SELECT Driver.driver_id,
CONCAT(Driver.firstname, ' ', Driver.lastname) AS DriverFullName
FROM Deliver, Driver
WHERE Driver.driver_id = Deliver.driver_id
GROUP BY Driver.lastname, Driver.firstname, del_date,del_date, Driver.driver_id 
HAVING COUNT(Deliver.delivery_id)> 1;

SELECT Driver.driver_id,
CONCAT(Driver.firstname, ' ', Driver.lastname) AS DriverFullName
FROM Deliver, Driver
WHERE Driver.driver_id = Deliver.driver_id
GROUP BY Driver.driver_id, Driver.lastname, Driver.firstname
HAVING COUNT(Deliver.delivery_id) = 1;

SELECT Driver.driver_id,
CONCAT(Driver.firstname, ' ', Driver.lastname) AS DriverFullName
FROM Deliver, Driver
WHERE Driver.driver_id = Deliver.driver_id
GROUP BY Driver.lastname, Driver.firstname, Driver.driver_id 
HAVING COUNT(Deliver.delivery_id)> 1;

SELECT driver_id, SUM(0.20 * distance + 0.02 * weight) AS 'Total Earned' FROM Deliver
GROUP BY driver_id;
SELECT driver_id, SUM((0.20 * distance) + (0.02 * weight)) AS Total_Earned FROM Deliver
WHERE driver_id = 'D020'
GROUP BY driver_id;


SELECT driver_id, COUNT(*) AS deliveries_done FROM Deliver
GROUP BY driver_id;
SELECT COUNT(*)
FROM Deliver;


SELECT pickup_date, charge 
FROM Deliver 
WHERE pickup_date >= '1995/11/01' AND pickup_date < '1995/12/31';

UPDATE Deliver SET charge = distance* 0.1
WHERE pickup_date >= '1995/11/01' AND pickup_date < '1995/12/31';

SELECT * INTO NewTable
FROM Deliver
WHERE pickup_date >= '1995/11/01' AND pickup_date < '1995/12/31';

SELECT * FROM Customer;

SELECT * FROM Deliver;

ALTER TABLE Driver ADD CONSTRAINT ck_Pointers CHECK (points > 1);

ALTER TABLE Driver DROP CONSTRAINT ck_Pointers;

ALTER TABLE Driver ADD CONSTRAINT ck_DOB CHECK (dob<GETDATE());

EXECUTE sp_helpconstraint Driver;

ALTER TABLE Deliver ADD CONSTRAINT ck_DelDate CHECK (del_date > pickup_date);

ALTER TABLE Deliver NOCHECK CONSTRAINT ALL;

ALTER TABLE Deliver CHECK CONSTRAINT ALL;

EXECUTE sp_tables @table_name = 'Driver';

EXECUTE sp_helpconstraint 'Driver' ;

EXECUTE sp_columns 'Driver' ;

CREATE PROCEDURE TotalPay
@driver NCHAR(4),
@pay MONEY OUTPUT
AS
SET @pay = (SELECT SUM(amount) FROM Payslip WHERE Payslip.driver_id = @driver);
GO

DECLARE @pay MONEY;
EXECUTE TotalPay 'D010', @pay OUTPUT;
PRINT @pay;
PRINT 'The total payslip = #' + CAST(@pay AS NVARCHAR(6));

/*Write a procedure that counts and totals the number of invoices that apply to a given customer, 
specified by input of the customer name. The routine should allow wildcard inputs. The count and total 
should be output as variables. Test your procedure by executing and printing the outputs.*/

CREATE OR ALTER PROCEDURE CountTotal
@customer NVARCHAR(60),
@count INT OUTPUT,
@totalamount MONEY OUTPUT
AS
SET @count = (SELECT COUNT(*)
	FROM Invoice, Customer 
	WHERE Invoice.customer_id = Customer.customer_id AND Customer.cust_name LIKE @customer)

SET @totalamount = (SELECT SUM(amount) FROM Invoice, Customer 
	WHERE Invoice.customer_id = Customer.customer_id AND Customer.cust_name LIKE @customer)
GO

DECLARE @count INT;
DECLARE @totalamount MONEY;
EXECUTE CountTotal 'Smith%', @count OUTPUT, @totalamount OUTPUT;
PRINT @count;
PRINT @totalamount;
PRINT 'The total amount of invoices = ' + CAST(@count AS NVARCHAR(20)) + 
' The total amount of invoices =  ' + CAST(@totalamount AS  NVARCHAR(20)) ;



SELECT * FROM Invoice;
SELECT * FROM Customer;
EXECUTE sp_help Customer;



