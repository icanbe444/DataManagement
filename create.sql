CREATE DATABASE Pizza_2213884;
USE Pizza_2213884;

CREATE TABLE Pizzas(
pizza_id nchar(30) NOT NULL,
name nchar(30) NOT NULL,
chef_id nchar(30) NOT NULL,
CONSTRAINT pk_Pizza PRIMARY KEY (pizza_id),
CONSTRAINT fk_Pizzas_Chefs FOREIGN KEY  (chef_id) REFERENCES Chefs(chef_id) ON DELETE CASCADE ON UPDATE CASCADE
);






-- Chefs (ID, title and name)
CREATE TABLE Chefs(
chef_id nchar(30),
title nchar(10),
name nchar(100),
CONSTRAINT chef_id PRIMARY KEY (chef_id)
);

-- C01	Mr	Cesare
-- C02	Ms	Lucrezia
-- C03	Mr	Paolo
-- C04	Mrs	Francesca

CREATE TABLE Toppings(
toppingsid varchar(30),
name varchar(100),
cost MONEY,
vegetarian_flag BIT
)
