use QVAN_2213884;

SELECT * FROM Deliver; 
SELECT pickup_date, charge FROM Deliver WHERE pickup_date >= '1995/11/01' AND pickup_date < '1995/12/31';

UPDATE Deliver SET charge =  0.2*distance + 0.02 * weight 
WHERE pickup_date >= '1995/11/01' AND pickup_date < '1995/12/31';

SELECT * FROM Driver WHERE points = 11;

SELECT * FROM invoice;
DELETE FROM Invoice WHERE paid = 1;


SELECT * INTO Deliver_Archive FROM Deliver
WHERE Deliver.pickup_date <= '1995/12/31';

 

SELECT * FROM Customer;
INSERT INTO Customer (customer_id, cust_name, post_town, tel) VALUES ('C00070', 'Paul', 'Glasborough', '01224-88888');


INSERT INTO Deliver_Archive
SELECT * FROM DELIVER
WHERE Deliver.pickup_date BETWEEN '1/1/1996' AND '1/31/1996';


SELECT * INTO Driver_Archive FROM Driver;

SELECT * FROM Driver_Archive;

SELECT * FROM Driver_Archive WHERE driver_id = 'D060';
 





