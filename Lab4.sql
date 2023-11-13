USE QVAN_2213884;



CREATE PROCEDURE ShowCustomers 
AS
PRINT 'NAME OF Customers';
SELECT C.cust_name, C.cust_address FROM Customer C;
GO

DROP PROCEDURE ShowCustomers;

EXECUTE ShowCustomers;


ALTER PROCEDURE ShowCustomers
@firstname NVARCHAR(30),
@lastname NVARCHAR(30)
AS
SELECT * FROM Customer
WHERE @firstname = firstname AND @lastname = lastname;
GO


SELECT * FROM Deliver WHERE customer_id


CREATE PROCEDURE showCustomer
AS PRINT 'DISPLAYER customer details';
SELECT * FROM Customer;

EXEC showCustomer


CREATE PROCEDURE Temp_Employee
AS 
CREATE TABLE #temp_customer(
JobTitle varchar(100),
EmployeePerJob int,
AvgAgeint int,
AvgSalary int
)


EXECUTE sp_tables @table_name = 'Driver' ;
EXECUTE sp_tables 'Driver' ;
EXECUTE sp_tables 'D%', dbo;

EXECUTE sp_columns 'Driver';

EXECUTE sp_helpconstraint 'Driver';

CREATE OR ALTER PROCEDURE showDrivers
AS
SELECT * FROM Driver;
GO

EXEC showDrivers
ALTER PROCEDURE showDrivers
AS
SELECT firstname, lastname FROM Driver;
GO


ALTER PROCEDURE showDrivers
@firstname nvarchar(30),
@lastname nvarchar(30)
AS
SELECT * FROM Driver 
WHERE @firstname = firstname AND @lastname = lastname;
GO


EXEC showDrivers @firstname = 'Ernie', @lastname = 'Forres'


/*
Exercise 2
Write and test a procedure that takes a customer’s 
ID number as input and lists all 
deliveries made to that customer.
*/

CREATE OR ALTER PROCEDURE ShowAllDeliveries
@customer_id nvarchar(30)
AS
SELECT D.delivery_id, D.driver_id, C.customer_id, C.cust_name, D.pickup_date, D.delivery_id 
FROM Deliver D INNER JOIN Customer C ON D.customer_id = C.customer_id
WHERE D.customer_id = @customer_id;
GO

EXEC ShowAllDeliveries @customer_id = 'C00010' 

/*We can set default values for the input parameters:*/

CREATE OR ALTER PROCEDURE ShowDriversInput
@firstname nvarchar(30) = '%A',
@lastname nvarchar(30) = '%'
AS
SELECT * FROM Driver WHERE firstname LIKE @firstname AND lastname LIKE @lastname;
GO

EXEC ShowDriversInput 'L%';



/*Exercise 3
Write and test a procedure that lists full details of all paid invoices or all unpaid invoices. 
There should be an input parameter that determines whether paid or unpaid invoices are returned. 
The default should be unpaid invoices.
*/


CREATE OR ALTER PROCEDURE paid_unpaid_invoice
@paid int = 1,
@unpaid int = 0
AS
SELECT * FROM Invoice WHERE @paid = 1 AND @unpaid = 0;

EXEC paid_unpaid_invoice @paid = 1;



CREATE PROCEDURE TotalPay
@Driver NCHAR(4) = 'D010',
@Pay MONEY OUTPUT

AS

SET @Pay = (SELECT sum(amount)
FROM Payslip
WHERE driver_id = @Driver
);
GO
DECLARE @Paytest MONEY;

EXECUTE TotalPay  'D010', @Paytest OUTPUT;

PRINT @Paytest;
PRINT 'The total paid to the driver is: £' + CAST(@Paytest As NVARCHAR(6));
