CREATE DATABASE Pizza_2213884;
USE Pizza_2213884;

CREATE TABLE Pizzas(
pizza_id nchar(30) NOT NULL,
name nchar(30) NOT NULL,
chef_id nchar(30) NOT NULL,
CONSTRAINT pk_Pizza PRIMARY KEY (pizza_id),
CONSTRAINT ck_pizza_id CHECK (pizza_id like 'C[0-9],[0-9]'),
CONSTRAINT fk_Pizzas_Chefs FOREIGN KEY  (chef_id) REFERENCES Chef(chef_id) ON DELETE CASCADE ON UPDATE CASCADE
);

EXEC sp_help Chef;
CREATE TABLE Chefs (
chef_id         NCHAR(30)        NOT NULL,
title           NVARCHAR(30)     NULL,
name            NVARCHAR(100)    NULL,
CONSTRAINT ck_title CHECK (title in ('MR', 'MISS', 'MRS')),
CONSTRAINT ck_chef_id CHECK (chef_id like 'C[0-9],[0-9]'),
CONSTRAINT pk_Chef PRIMARY KEY (chef_id));

CREATE TABLE Toppings(
toppingsid varchar(30),
name varchar(100),
cost MONEY,
vegetarian_flag BIT
CONSTRAINT ck_toppingsid CHECK (toppingsid like 'C[0-9],[0-9]'),
)


CREATE TABLE HasToppings(
topping_id       NCHAR(30)        NOT NULL,
pizza_id             NCHAR(30)        NOT NULL,
CONSTRAINT pk_HasToppings PRIMARY KEY (topping_id, pizza_id),
CONSTRAINT fk_HasToppings_Pizza FOREIGN KEY (pizza_id) REFERENCES Pizzas(pizza_id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_HasToppings_Topping FOREIGN KEY (topping_id) REFERENCES Topping(topping_id) ON DELETE CASCADE ON UPDATE CASCADE);