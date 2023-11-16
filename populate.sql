CREATE DATABASE Pizza_2213884;
GO

USE Pizza_2213884;
GO

/* Create table Pizza */

INSERT INTO Pizzas
VALUES ( 'P01',	'Hawaiian',	'C01');
INSERT INTO Pizzas
VALUES ('P02',	'Stromboli', 'C02');
INSERT INTO Pizzas
VALUES ('P03',	'Meat Feast',	'C01');


INSERT INTO Chef
VALUES ('C01',	'Mr',	'Cesare');
INSERT INTO Chef
VALUES ('C02',	'Ms',	'Lucrezia');
INSERT INTO Chef
VALUES ('C03',	'Mr',	'Paolo');
INSERT INTO Chef
VALUES ('C04',	'Mrs',	'Francesca');

INSERT INTO Topping
VALUES ('T01',	'Chilli',	 0.5,	1)
INSERT INTO Topping
VALUES ('T02',	'Jalapeno',	 0.6, 	1)
INSERT INTO Topping
VALUES ('T03',	'Onion',     0.2,   1)
INSERT INTO Topping
VALUES ('T04',	'Pepper',    0.4,	1)
INSERT INTO Topping
VALUES ('T05',	'Ham',	     1.0,   0)
INSERT INTO Topping
VALUES ('T06',	'Pepperoni', 0.5,	0)
INSERT INTO Topping
VALUES ('T07',	'Mushroom',	 0.3,	1)
INSERT INTO Topping
VALUES ('T08', 'Pineapple',  1.0,	1)
INSERT INTO Topping
VALUES ('T09',	'Sausage',	 0.5,	0)
INSERT INTO Topping
VALUES ('T10',	'Olive',	 0.5,	1)

INSERT INTO HasToppings
VALUES('T05','P01'),('T08','P01'),('T03','P02'),('T01','P02'),('T02','P02'),
('T09','P03'),('T06','P03'),('T03','P03');

ALTER TABLE HasToppings DROP COLUMN hastoppings_id;
SELECT * FROM HasToppings;



