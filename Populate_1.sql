CREATE DATABASE Pizza_2213884;
GO

USE Pizza_2213884;
GO

/* Create table Pizza */
CREATE TABLE  Pizzas (
pizza_id  NCHAR(30)          NOT NULL,
name      NVARCHAR(100)      NULL,
chef_id   NCHAR(30)          NOT NULL,
CONSTRAINT pk_Pizza PRIMARY KEY (pizza_id),
CONSTRAINT fk_Pizza_Chef FOREIGN KEY (chef_id) REFERENCES Chef(chef_id) 
                                          ON DELETE CASCADE ON UPDATE CASCADE);

EXEC sp_help 'Chefs';
ALTER TABLE Chefs ALTER COLUMN chef_id NCHAR(30); 
ALTER TABLE Chefs
DROP TABLE Chefs;
SHOW TABLE Chefs;
CREATE TABLE Chef (
chef_id         NCHAR(30)        NOT NULL,
title           NVARCHAR(30)     NULL,
name            NVARCHAR(100)    NULL,
CONSTRAINT pk_Chef PRIMARY KEY (chef_id));


CREATE TABLE Topping(
topping_id       NCHAR(30)         NOT NULL,
name             NVARCHAR(100)     NULL,
cost             MONEY            NULL,
vegetarian_flag  BIT              NULL,
CONSTRAINT pk_Topping PRIMARY KEY (topping_id));
DROP TABLE Topping;
ALTER TABLE Topping MODIFY COLUMN cost DECIMAL(6, 4);

CREATE TABLE HasToppings(
hastoppings_id NCHAR(30) NOT NULL,
topping_id       NCHAR(30)        NOT NULL,
pizza_id             NCHAR(30)        NOT NULL,
CONSTRAINT pk_HasToppings PRIMARY KEY (topping_id, pizza_id),
CONSTRAINT fk_HasToppings_Pizza FOREIGN KEY (pizza_id) REFERENCES Pizzas(pizza_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_HasToppings_Topping FOREIGN KEY (topping_id) REFERENCES Topping(topping_id) ON DELETE CASCADE ON UPDATE CASCADE);



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


DELETE FROM Topping;

SELECT * FROM Pizzas;
SELECT * FROM Chef;
SELECT * FROM Topping;
SELECT * FROM HasToppings;

SELECT pizza.pizza_id, Pizza.name, Chef.name FROM Pizza pizza, Chef chef WHERE Pizza.chef_id = Chef.chef_id ORDER BY pizza_id;

SELECT pizza_id, Pizza.name,  CONCAT(title, ' ', Chef.name ) AS 'Full details of Chef' FROM Pizza, Chef WHERE Pizza.chef_id = Chef.chef_id ORDER BY pizza_id;

SELECT pizza_id, Pizza.name, SUM(cost) AS 'pizza cooked by Cesare'  FROM Pizza, Chef, Topping WHERE Pizza.chef_id = Chef.chef_id  AND Chef.name = 'Cesare' GROUP BY pizza_id, Pizza.name;


INSERT INTO HasToppings
VALUES ('H01', 'T05', 'P01');
INSERT INTO HasToppings
VALUES ('H02', 'T03', 'P02');

INSERT INTO HasToppings
VALUES('H03', 'T06', 'P03');

INSERT INTO HasToppings
VALUES('H03', 'T06','05', 'P03');

EXEC sp_help 'HasToppings';