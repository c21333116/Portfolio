DROP TABLE Booking_receipt_staff;
DROP TABLE Party_participants;
DROP TABLE Booking_receipt;
DROP TABLE Customers;
DROP TABLE Tables;
DROP TABLE Staff;
DROP TABLE Restaurants;

-- table Restaurants, which has unique numeric 
-- restaurant identifier, address and phone number 
CREATE TABLE Restaurants(
   restaurant_id_number NUMBER(6),
   phone_number VARCHAR2(50) NOT NULL UNIQUE,
   city VARCHAR2(50) NOT NULL,
   address VARCHAR2(50) NOT NULL,
PRIMARY KEY (restaurant_id_number)
);
COMMIT;

-- table Staff stores details of staff: 
-- their unique identifier, name, address, phone number, 
-- email address (must be their company email (ending with @burgershack.com)), date of birth,
-- start date of employment, location of their restaurant. 
CREATE TABLE Staff(
   staff_id_number NUMBER(6),
   name VARCHAR2(50),
   position VARCHAR2(50),
   phone_number VARCHAR2(50) UNIQUE,
   email_address VARCHAR2(50) UNIQUE CHECK (email_address LIKE '%@burgershack.com'),
   birthday_date  DATE,
   working_begining_date  DATE,
   restaurant_id_number NUMBER(6),
CONSTRAINT restaurant_address_fk  FOREIGN KEY (restaurant_id_number)  REFERENCES Restaurants (restaurant_id_number),   
PRIMARY KEY (staff_id_number)
);
COMMIT;

-- each table in every restaurant has a unique number and details of the type 
-- of table and its location in the restaurant. There are four types of 
-- tables (2, 4, 6 and 8 seater) and 2 locations (window or interior).
CREATE TABLE Tables(
   table_id_number NUMBER(6),
   restaurant_id_number NUMBER(6),
   seater_type NUMBER(2) CHECK (seater_type IN (2, 4, 6, 8)),    
   location VARCHAR2(10) CHECK (location IN ('window', 'interior')),
CONSTRAINT restaurant_fk  FOREIGN KEY (restaurant_id_number)  REFERENCES Restaurants (restaurant_id_number),   
PRIMARY KEY (table_id_number)
);
COMMIT;

-- table Customers, which stores privided by customers or customer's "party" 
-- information: name, address, and email address each of which cannot be missin.
-- also providing age, because to make a booking customer must be over 18
-- (for this exits the trigger Create_booking) 
CREATE TABLE Customers(
   customer_id_number NUMBER(6),
   name VARCHAR2(50) NOT NULL,
   phone_number VARCHAR2(50) UNIQUE,
   email_address VARCHAR2(50) NOT NULL CHECK (email_address LIKE '%@%.%') UNIQUE,
   birthday_date  DATE,
   city VARCHAR2(50) NOT NULL,
   address VARCHAR2(50) NOT NULL,
PRIMARY KEY (customer_id_number)
);
COMMIT;

-- table Booking_receipt stores the information about booking ID, customer,
-- booking time, table and the number of people at the table (no more than 8)
CREATE TABLE Booking_receipt(
   booking_id_number NUMBER(6),
   customer_id_number NUMBER(6),
   table_id_number NUMBER(6),
   receipt_date_time TIMESTAMP WITH LOCAL TIME ZONE NOT NULL,
   people_number NUMBER(2) CHECK  (people_number < 9),   
   booking_type VARCHAR2(50) CHECK (booking_type IN ('online', 'in person')),    
CONSTRAINT customer_fk  FOREIGN KEY (customer_id_number)  REFERENCES Customers (customer_id_number),   
CONSTRAINT table_fk  FOREIGN KEY (table_id_number)  REFERENCES Tables (table_id_number),   
PRIMARY KEY (booking_id_number)
);
COMMIT;

-- table for controling parties. Stores details of customers and 
-- booking where party was
CREATE TABLE Party_participants(
   booking_id_number NUMBER(6),
   customer_id_number NUMBER(6),   
CONSTRAINT customer_party_fk  FOREIGN KEY (booking_id_number)  REFERENCES Customers (customer_id_number),   
CONSTRAINT table_party_fk  FOREIGN KEY (customer_id_number)  REFERENCES Tables (table_id_number),   
PRIMARY KEY (booking_id_number, customer_id_number)
);
COMMIT;

-- table Booking_receipt_staff stores information about bokking and staff who served the table
CREATE TABLE Booking_receipt_staff(
   booking_id_number NUMBER(6),
   staff_id_number NUMBER(6),   
CONSTRAINT receipt_booking_fk  FOREIGN KEY (booking_id_number)  REFERENCES Customers (customer_id_number),   
CONSTRAINT staff_booking_fk  FOREIGN KEY (staff_id_number)  REFERENCES Staff (staff_id_number),   
PRIMARY KEY (booking_id_number, staff_id_number)
);
COMMIT;

-- trigger Create_booking cheks, is the customer, who is making the booking is older than 18, 
-- and if the number of people for booking less than or equivalent to the table number of places
CREATE OR REPLACE TRIGGER Create_booking
BEFORE INSERT ON Booking_receipt FOR EACH ROW
declare
    birthday DATE;
    age NUMBER;
    seats_number NUMBER;
BEGIN
    SELECT birthday_date INTO birthday FROM Customers where customer_id_number = :New.customer_id_number;
    SELECT months_between(ROUND(sysdate), birthday)/12 INTO age from dual;
    SELECT seater_type INTO seats_number FROM Tables where table_id_number = :New.table_id_number;
    IF age < 18 THEN 
         RAISE_APPLICATION_ERROR(-20001, 'Customer must be more than 18 years to make a booking. This customers age is: '|| FLOOR(age));    
    ELSIF seats_number < :New.people_number THEN
         RAISE_APPLICATION_ERROR(-20001, 'Number of people more than seats quantity. Seats quantity is: ' || seats_number || ', and people number is: ' || :New.people_number);    
    ELSE
        DBMS_OUTPUT.put_line ('Succesfully booked. Your receipt number is : '||:New.booking_id_number);
    END IF;
END; 
/
COMMIT;

-- VIEW and LEFT OUTER Join
-- VIEW for represent Partie info such as
-- holder details: id and name;
-- party members (guests) details: id, name, phone number, email, DoB, address;
-- booking details: id, time, type, number of people
CREATE OR REPLACE VIEW Party_members AS
SELECT Party_participants.booking_id_number booking_id, 
(SELECT Customers.customer_id_number FROM Booking_receipt
LEFT JOIN Customers ON Booking_receipt.customer_id_number = Customers.customer_id_number 
WHERE Booking_receipt.booking_id_number = Party_participants.booking_id_number) Holder_id,
(SELECT Customers.name FROM Booking_receipt 
LEFT JOIN Customers ON Booking_receipt.customer_id_number = Customers.customer_id_number 
WHERE Booking_receipt.booking_id_number = Party_participants.booking_id_number) Holder_name,
Booking_receipt.table_id_number, Booking_receipt.receipt_date_time, 
Booking_receipt.people_number, Booking_receipt.booking_type, 
Customers.customer_id_number Guest_id, Customers.name Guest_name, 
Customers.phone_number Guest_phone, Customers.email_address Guest_email, 
Customers.birthday_date Guest_dob, Customers.city Guest_city,  Customers.address Guest_address
FROM Party_participants 
LEFT JOIN Customers ON Customers.customer_id_number = Party_participants.customer_id_number
LEFT JOIN Booking_receipt ON Booking_receipt.booking_id_number = Party_participants.booking_id_number
ORDER BY Party_participants.booking_id_number;
COMMIT;