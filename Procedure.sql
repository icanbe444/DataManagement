USE Pizza_2213884;


/*The price of fish and meat has increased and Black Oil has decided to increase by 10% the price of all non-vegetarian 
pizza toppings bought as “extra toppings”. Pizza prices will remain unchanged, as will vegetarian toppings.
a)	Write code to create a stored procedure toppingCost() which will return the cost of a topping (specified by name), 
including the 10% increase where applicable.
b)	Write code that calls the toppingCost() procedure for the ‘Sausage’ topping and displays the result. 
c)	Write code that calls the toppingCost() procedure for the ‘Pineapple’ topping and displays the result.
Code for this task should be saved in the file Procedure.sql
*/

CREATE PROCEDURE toppingCost
@toppingname nvarchar(30),
@toppingcost MONEY OUTPUT
AS
IF(SELECT Topping.vegetarian_flag FROM Topping WHERE @toppingname = Topping.name) = 1
	SET @toppingcost = (SELECT Topping.cost FROM Topping WHERE @toppingname = Topping.name);
ELSE 
	SET @toppingcost = (SELECT Topping.cost*0.1 + Topping.cost FROM Topping WHERE @toppingname = Topping.name);
GO
DROP PROCEDURE toppingCost;
/*Write code that calls the toppingCost() procedure for the ‘Sausage’ topping and displays the result.*/
DECLARE @toppingcost MONEY;
EXECUTE toppingCost 'Sausage', @toppingcost output;
PRINT @toppingcost;

/*Write code that calls the toppingCost() procedure for the ‘Pineapple’ topping and displays the result.*/
DECLARE @toppingcost MONEY;
EXECUTE toppingCost 'Pineapple', @toppingcost output;
PRINT @toppingcost;


SELECT Topping.vegetarian_flag FROM Topping WHERE Topping.name = 'Sausage';

