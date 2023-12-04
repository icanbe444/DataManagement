USE QVAN_2213884;

/*Write a procedure that counts and totals the number of invoices that apply to a given customer, 
specified by input of the customer name. The routine should allow wildcard inputs. The count and total 
should be output as variables. Test your procedure by executing and printing the outputs.*/

CREATE OR ALTER PROCEDURE CountTotal
@customer NVARCHAR(60),
@count INT OUTPUT,
@totalamount MONEY OUTPUT
AS
SET @count = (SELECT  COUNT(*) AS 'Total No. of Inovice' 
				FROM Invoice, Customer
				WHERE Customer.cust_name LIKE @customer AND Customer.customer_id = Invoice.customer_id)
SET @totalamount = (SELECT  SUM(amount) AS 'Invoice Sum' FROM Invoice, Customer 
				WHERE Customer.cust_name LIKE @customer AND Customer.customer_id = Invoice.customer_id);
GO

DECLARE @count INT;
DECLARE @totalamount MONEY;
EXECUTE CountTotal 'Smith%', @count OUTPUT, @totalamount OUTPUT;
PRINT @count;
PRINT @totalamount;
PRINT 'The total invoice issued is: '  + CAST(@count AS NVARCHAR(20)) + ' and total amount of invoice = ' + CAST(@totalamount AS NVARCHAR(20));




SELECT * FROM Invoice;
SELECT * FROM Driver;

DECLARE @IDtest VARCHAR(20);
SET @IDtest = 'D100'

IF EXISTS(SELECT * FROM Driver WHERE driver_id = @IDtest )
	SELECT CONCAT(firstname, ' ', lastname) FROM Driver WHERE driver_id = @IDtest;
ELSE
	PRINT 'There is no driver with ID ' + @IDtest;



/*Write a command block that returns the cust_name of every customer with a given post_town or a suitable 
message if there are no such customers. Test that it works by changing the value of post_town.*/
SELECT * FROM Driver;


DECLARE @post_town VARCHAR(20);
SET @post_town = 'Glasborough'
IF EXISTS(SELECT * FROM Customer WHERE post_town = @post_town)
	SELECT cust_name FROM Customer WHERE post_town = @post_town
ELSE 
	PRINT 'There are no customers from ' + @post_town;



	--Procedure for excercise 
CREATE OR ALTER PROCEDURE postTest
@post_town NVARCHAR(20)
AS

IF EXISTS(SELECT * FROM Customer WHERE post_town = @post_town)
	SELECT cust_name FROM Customer WHERE post_town = @post_town
ELSE 
	PRINT 'There are no customers from ' + @post_town
GO

EXECUTE postTest 'Glasboroughs';

/*Write a command block that first declares a variable to be equal to a given driver_id, e.g. ‘D010’. Then, 
if the driver has more than 11 points, it should delete all their payslips and update their license to ‘BARRED’*/
DECLARE @driver_id NVARCHAR(4) = 'D010';
IF (SELECT points FROM Driver WHERE driver_id = @driver_id) > 11
	BEGIN
	DELETE FROM Payslip WHERE Payslip.driver_id = @driver_id 
	UPDATE Driver SET licence = 'Barred' WHERE driver_id = @driver_id;
	END 

	SELECT * FROM Driver WHERE  driver_id = 'D010';

--Procedure for exercise

CREATE OR ALTER PROCEDURE UpdateLicence
@driver_id NVARCHAR(20)
AS
IF (SELECT points FROM Driver WHERE driver_id = @driver_id) > 11
	BEGIN
	DELETE FROM Payslip WHERE Payslip.driver_id = @driver_id 
	UPDATE Driver SET licence = 'Barred' WHERE driver_id = @driver_id;
	END 

	SELECT * FROM Driver WHERE  driver_id = @driver_id;
GO

EXECUTE updateLicence 'D010';

