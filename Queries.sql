/*
Query A: For each kind of pizza, display the ID and name of the pizza, 
and full details of the chef who cooks the pizza. 
Order the output by the name of the pizza.
*/


USE Pizza_2213884;
GO

SELECT P.pizza_id, P.name AS 'Name of Pizza', C.chef_id, CONCAT(C.title ,' ' , C.name) AS "Chef's FullName" 
FROM Pizzas P, Chef C ORDER BY P.name;

/*Query B: For each pizza cooked by chef Cesare, display the ID and name of the pizza 
and the total cost of all its toppings.
*/

SELECT P.pizza_id, P.name AS 'Pizza_Name',C.name AS 'Chef Name', SUM(T.cost) AS 'Total Cost'
FROM Pizzas P, Chef C,Topping T 
WHERE  C.name LIKE 'Cesare' GROUP BY P.pizza_id, P.name, C.name; 





