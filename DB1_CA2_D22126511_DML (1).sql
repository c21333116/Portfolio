-- Inserting data into table Restaurants
INSERT INTO Restaurants VALUES (1, '+353852869551', 'Dublin', '117 Dame Street');
INSERT INTO Restaurants VALUES (2, '+353852869552', 'Dublin', '20 Suffolk St');
INSERT INTO Restaurants VALUES (3, '+353852869553', 'Galway', '57 Dominick St Lower');
INSERT INTO Restaurants VALUES (4, '+353852869554', 'Cork', '29 MacCurtain Street');
INSERT INTO Restaurants VALUES (5, '+353852869555', 'Dingle', '4 John St');
INSERT INTO Restaurants VALUES (6, '+353852869556', 'Killarney', '9 Plunkett St');
COMMIT;

-- Inserting data into table Staff
INSERT INTO Staff VALUES (1, 'Jean Gunnhildr', 'manager', '+353852869591', 'jean.gunnhildr@burgershack.com', DATE'1998-03-14', DATE'2014-08-01', 1);
INSERT INTO Staff VALUES (2, 'Diluc Ragnvindr', 'manager', '+353852869592', 'diluc.ragnvindr@burgershack.com', DATE'1998-04-30', DATE'2012-09-01', 2);
INSERT INTO Staff VALUES (3, 'Lisa Minci', 'manager', '+353852869593', 'lisa.minci@burgershack.com', DATE'1998-03-09', DATE'2015-07-01', 3);
INSERT INTO Staff VALUES (4, 'Albedo Kreideprinz', 'manager', '+353852869594', 'albedo.keideprinz@burgershack.com', DATE'2002-09-13', DATE'2022-08-01', 4);
INSERT INTO Staff VALUES (5, 'Klee Kreideprinz', 'manager', '+353852869595', 'fire.keideprinz@burgershack.com', DATE'2012-09-13', DATE'2022-10-01', 5);
INSERT INTO Staff VALUES (6, 'Diona Kätzlein', 'waiter', '+353852869596', 'diona.kätzlein@burgershack.com', DATE'2012-01-17', DATE'2022-06-01', 1);
INSERT INTO Staff VALUES (7, 'Keya Alberih', 'waiter', '+353852869597', 'keya.alberih@burgershack.com', DATE'1998-11-30', DATE'2022-08-01', 2);
INSERT INTO Staff VALUES (8, 'Barbara Gunnhildr', 'waiter', '+353852869598', 'barbara.gunnhildr@burgershack.com', DATE'2002-07-05', DATE'2022-06-01', 3);
INSERT INTO Staff VALUES (9, 'Amber Teigrov', 'waiter', '+353852869599', 'amber.teigrov@burgershack.com', DATE'2000-08-10', DATE'2017-05-01', 4);
INSERT INTO Staff VALUES (10, 'Mika Schmidt', 'waiter', '+353852869510', 'mika.schmidt@burgershack.com', DATE'2002-02-05', DATE'2022-10-01', 5);
COMMIT;

-- Inseting data into Tables
INSERT INTO Tables VALUES (1, 1, 8, 'interior');
INSERT INTO Tables VALUES (2, 1, 8, 'window');
INSERT INTO Tables VALUES (3, 1, 4, 'interior');
INSERT INTO Tables VALUES (4, 2, 2, 'interior');
INSERT INTO Tables VALUES (5, 2, 4, 'interior');
INSERT INTO Tables VALUES (6, 2, 2, 'window');
INSERT INTO Tables VALUES (7, 2, 8, 'interior');
INSERT INTO Tables VALUES (8, 3, 2, 'window');
INSERT INTO Tables VALUES (9, 3, 2, 'window');
INSERT INTO Tables VALUES (10, 3, 2, 'window');
INSERT INTO Tables VALUES (11, 4, 2, 'window');
INSERT INTO Tables VALUES (12, 4, 2, 'interior');
INSERT INTO Tables VALUES (13, 4, 2, 'interior');
INSERT INTO Tables VALUES (14, 4, 2, 'window');
INSERT INTO Tables VALUES (15, 5, 2, 'window');
INSERT INTO Tables VALUES (16, 5, 2, 'interior');
INSERT INTO Tables VALUES (17, 5, 2, 'interior');
INSERT INTO Tables VALUES (18, 6, 2, 'window');
INSERT INTO Tables VALUES (19, 6, 2, 'interior');
INSERT INTO Tables VALUES (20, 6, 2, 'interior');
COMMIT;


-- Inserting data into Customers
INSERT INTO Customers VALUES (1, 'Aether Traveller', '+353211869590', 'traveler_boy@gmail.com', DATE'1999-01-01', 'Killarney', 'V93 RC95');
INSERT INTO Customers VALUES (2, 'Lumine Traveller', '+353211869591', 'traveler_girl@gmail.com', DATE'1999-01-01', 'Dingle', '45 Dramkondra');
INSERT INTO Customers VALUES (3, 'Bennet Rota Calamitas', '+353211869592', 'blessed@gmail.com', DATE'2002-02-28', 'Dublin', 'V93 RC93');
INSERT INTO Customers VALUES (4, 'Razor Todd Haberkorn', '+353211869593', 'wolfboy@gmail.com', DATE'2002-09-09', 'Dublin', '22 MacCurtain Street');
INSERT INTO Customers VALUES (5, 'Ajax Childe', '+353211869594', 'sealseal@gmail.com', DATE'1999-07-20', 'Dublin', '69 Curtain Street');
INSERT INTO Customers VALUES (6, 'Rozaria Holly', '+353211869595', 'roseslover@gmail.com', DATE'1999-01-24', 'Cork', '65 Rose Street');
COMMIT;

-- Inserting data into Booking_receipt
INSERT INTO Booking_receipt VALUES (1, 1, 2, TO_TIMESTAMP('2022-08-1 14:02:44', 'YYYY-MM-DD HH24:MI:SS'), 8, 'online');
INSERT INTO Booking_receipt VALUES (2, 1, 2, TO_TIMESTAMP('2022-08-2 14:02:44', 'YYYY-MM-DD HH24:MI:SS'), 8, 'in person');
INSERT INTO Booking_receipt VALUES (3, 1, 2, TO_TIMESTAMP('2022-08-3 14:02:44', 'YYYY-MM-DD HH24:MI:SS'), 8, 'in person');
INSERT INTO Booking_receipt VALUES (4, 2, 3, TO_TIMESTAMP('2022-08-4 14:02:44', 'YYYY-MM-DD HH24:MI:SS'), 2, 'in person');
INSERT INTO Booking_receipt VALUES (5, 2, 3, TO_TIMESTAMP('2022-08-5 14:02:44', 'YYYY-MM-DD HH24:MI:SS'), 3, 'online');
INSERT INTO Booking_receipt VALUES (6, 2, 3, TO_TIMESTAMP('2022-05-6 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 4, 'in person');
COMMIT;

-- Insert data into Party_participants
INSERT INTO Party_participants VALUES (1, 2);
INSERT INTO Party_participants VALUES (1, 3);
INSERT INTO Party_participants VALUES (1, 4);
INSERT INTO Party_participants VALUES (2, 5);
INSERT INTO Party_participants VALUES (2, 3);
INSERT INTO Party_participants VALUES (2, 4);
INSERT INTO Party_participants VALUES (3, 6);
INSERT INTO Party_participants VALUES (3, 3);
INSERT INTO Party_participants VALUES (3, 2);
INSERT INTO Party_participants VALUES (3, 5);
INSERT INTO Party_participants VALUES (4, 1);
INSERT INTO Party_participants VALUES (4, 3);
INSERT INTO Party_participants VALUES (4, 4);
INSERT INTO Party_participants VALUES (5, 1);
INSERT INTO Party_participants VALUES (5, 3);
INSERT INTO Party_participants VALUES (5, 4);
INSERT INTO Party_participants VALUES (6, 5);
INSERT INTO Party_participants VALUES (6, 6);
INSERT INTO Party_participants VALUES (6, 1);
INSERT INTO Party_participants VALUES (6, 3);
INSERT INTO Party_participants VALUES (6, 4);
COMMIT;

-- Insert data into Booking_receipt_staff
INSERT INTO Booking_receipt_staff VALUES (1, 1);
INSERT INTO Booking_receipt_staff VALUES (1, 6);
INSERT INTO Booking_receipt_staff VALUES (2, 2);
INSERT INTO Booking_receipt_staff VALUES (2, 7);
INSERT INTO Booking_receipt_staff VALUES (3, 1);
INSERT INTO Booking_receipt_staff VALUES (3, 7);
INSERT INTO Booking_receipt_staff VALUES (4, 3);
INSERT INTO Booking_receipt_staff VALUES (4, 8);
INSERT INTO Booking_receipt_staff VALUES (5, 4);
INSERT INTO Booking_receipt_staff VALUES (5, 9);
INSERT INTO Booking_receipt_staff VALUES (6, 5);
INSERT INTO Booking_receipt_staff VALUES (6, 10);
COMMIT;

-- SELECTS STATEMENTS 

-- UPDATE combined with a subquery
-- Updates the staff position from staff table from 'waiter' to 'main waiter'
-- for waiter who did the biggest quantity of odrers
UPDATE Staff SET position = 'main waiter'
WHERE Staff.staff_id_number = (
    SELECT Booking_receipt_staff.staff_id_number
    FROM Booking_receipt_staff
    LEFT JOIN Staff ON Booking_receipt_staff.staff_id_number = Staff.staff_id_number
    WHERE UPPER(Staff.position) = 'WAITER'
    GROUP BY Booking_receipt_staff.staff_id_number
    ORDER BY COUNT(Booking_receipt_staff.booking_id_number) DESC, Booking_receipt_staff.staff_id_number ASC
    FETCH FIRST 1 ROWS ONLY
);

-- Query using a selection function (CASE)
-- selects information about booking (id and people number),
-- staff manager and idetificates is the bokking for party or no
SELECT Booking_receipt.booking_id_number, Booking_receipt.people_number,
Staff.staff_id_number, Staff.name,
CASE
    WHEN LOWER(Booking_receipt.people_number) < 5 THEN 'Not a party'
    WHEN LOWER(Booking_receipt.people_number) > 4 THEN 'Party'
END Is_part
FROM Booking_receipt_staff
LEFT JOIN  Booking_receipt  ON Booking_receipt.booking_id_number = Booking_receipt_staff.booking_id_number
LEFT JOIN  Staff  ON Staff.staff_id_number = Booking_receipt_staff.staff_id_number
WHERE LOWER(Staff.position) = 'manager';

-- INNER join using a GROUP Function
-- Shows the quantity of orders served by spesific staff member
SELECT Booking_receipt_staff.staff_id_number, Staff.name Staff_name, Staff.position, 
COUNT(Booking_receipt.booking_id_number) Orderes_served
FROM Booking_receipt_staff
INNER JOIN Booking_receipt ON Booking_receipt.booking_id_number = Booking_receipt_staff.booking_id_number
INNER JOIN Staff ON Staff.staff_id_number = Booking_receipt_staff.staff_id_number
GROUP BY Booking_receipt_staff.staff_id_number, Staff.name, Staff.position
ORDER BY Staff.position, Booking_receipt_staff.staff_id_number;

-- RIGHT OUTER Join
-- Shows the details (id, name and position) of staff 
-- who were serving the pacific booking (show the booking id)
SELECT Booking_receipt.booking_id_number, Staff.staff_id_number, Staff.name, Staff.position 
FROM Booking_receipt 
RIGHT JOIN BOOKING_RECEIPT_STAFF
ON BOOKING_RECEIPT_STAFF.booking_id_number = Booking_receipt.booking_id_number
RIGHT JOIN Staff
ON BOOKING_RECEIPT_STAFF.staff_id_number = Staff.staff_id_number
ORDER BY Booking_receipt.booking_id_number;

-- UNION
-- Selects all customers and party members once in a one table, specifying the type
SELECT DISTINCT 'Customer' AS Type, Customers.customer_id_number, Customers.name
FROM Booking_receipt
LEFT JOIN Customers ON Customers.customer_id_number = Booking_receipt.customer_id_number
UNION
SELECT DISTINCT 'Party member', Customers.customer_id_number, Customers.name 
FROM Party_participants
LEFT JOIN  Customers ON Customers.customer_id_number = Party_participants.customer_id_number;

-- INTERSECT
-- selects city where are no customers
SELECT city FROM Restaurants 
WHERE city NOT IN (
    SELECT DISTINCT city  
    FROM Restaurants
    INTERSECT  
    SELECT DISTINCT city 
    FROM Customers
);