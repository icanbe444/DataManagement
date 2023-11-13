USE QVAN_2213884;

IF EXISTS (SELECT * from Driver where Driver_ID = 'D010')
 SELECT firstname + ' ' + lastname from Driver where Driver_ID ='D010';
ELSE
 PRINT 'There is no driver with the given ID';



DECLARE @IDtest nchar(4);
SET @IDtest = 'D100';

IF EXISTS (SELECT * from Driver where Driver_ID = @IDtest)
 SELECT firstname + ' ' + lastname from Driver where Driver_ID = @IDtest;
ELSE
 PRINT 'There is no driver with ID ' + @IDtest;



/*Exercise 1
Write a command block that returns the cust_name of every customer with a given 
post_town or a suitable message if there are no such customers. Test that it 
works by changing the value of post_town.*/
SELECT * FROM Customer WHERE post_town = 'Glasborough';

DECLARE @posttest nvarchar(30);
SET @posttest= 'Fregtur';
IF EXISTS(SELECT * FROM Customer WHERE post_town = @posttest)
SELECT cust_name FROM Customer WHERE post_town = @posttest;
ELSE
PRINT 'There is no customer from ' + @posttest;


