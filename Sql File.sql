DROP TABLE airline CASCADE CONSTRAINTS PURGE;
DROP TABLE airplane CASCADE CONSTRAINTS PURGE;
DROP TABLE airport CASCADE CONSTRAINTS PURGE;
DROP TABLE booking CASCADE CONSTRAINTS PURGE;
DROP TABLE passenger CASCADE CONSTRAINTS PURGE;
DROP TABLE flight_instance CASCADE CONSTRAINTS PURGE;
DROP TABLE flight CASCADE CONSTRAINTS PURGE;
DROP TABLE ticket CASCADE CONSTRAINTS PURGE;

DROP SEQUENCE airline_seq;
DROP SEQUENCE airplane_seq;
DROP SEQUENCE airport_seq; 
DROP SEQUENCE passenger_seq; 
DROP SEQUENCE booking_seq; 
DROP SEQUENCE flight_instance_seq; 
DROP SEQUENCE flight_seq; 
DROP SEQUENCE ticket_seq; 


CREATE TABLE airline (
    airline_code   NUMBER NOT NULL,
    airline_name   VARCHAR2(50) NOT NULL
);

ALTER TABLE airline ADD CONSTRAINT airline_pk PRIMARY KEY ( airline_code );

Create sequence airline_seq start with 1;

create or replace TRIGGER T_airline_SEQ
BEFORE INSERT ON airline
FOR EACH ROW
BEGIN
  SELECT airline_seq.NEXTVAL INTO :NEW.airline_code FROM dual;
END;
/

INSERT INTO airline (airline_name) VALUES ('Emirates');
INSERT INTO airline (airline_name) VALUES ('Air Arabia');
INSERT INTO airline (airline_name) VALUES ('British Airways');
INSERT INTO airline (airline_name) VALUES ('Czech Airlines');
INSERT INTO airline (airline_name) VALUES ('Shanghai Airlines');
INSERT INTO airline (airline_name) VALUES ('Rossiya - Russian Airlines');
INSERT INTO airline (airline_name) VALUES ('Pakistan International Airlines');
INSERT INTO airline (airline_name) VALUES ('Turkish Airlines');
INSERT INTO airline (airline_name) VALUES ('Ukraine International');
INSERT INTO airline (airline_name) VALUES ('Vietnam Airlines');
INSERT INTO airline (airline_name) VALUES ('Oman Air');
INSERT INTO airline (airline_name) VALUES ('Singapore Airlines');
INSERT INTO airline (airline_name) VALUES ('Gulf Air');
INSERT INTO airline (airline_name) VALUES ('flydubai');
INSERT INTO airline (airline_name) VALUES ('SriLankan Airlines');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE airplane (
    airplane_id         NUMBER NOT NULL,
    airplane_name       VARCHAR2(50) NOT NULL,
    airplane_capacity   NUMBER NOT NULL,
    airplane_weight     NUMBER NOT NULL,
    airline_code        NUMBER NOT NULL
);

ALTER TABLE airplane ADD CONSTRAINT airplane_pk PRIMARY KEY ( airplane_id );

Create sequence airplane_seq start with 1;

create or replace TRIGGER T_airplane_SEQ
BEFORE INSERT ON airplane
FOR EACH ROW
BEGIN
  SELECT airplane_seq.NEXTVAL INTO :NEW.airplane_id FROM dual;
END;
/
       
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Airbus A340-500',372,575000,1);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Boeing 777-200',440,347450,2);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Airbus A380plus',555,560000,3);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Airbus A380-800',853,575000,4);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Boeing 747-8',700,447700,5);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Boeing 747-400',416,412770,6);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Ilyushin IL-86',605,208000,7);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Vickers VC10',151,152000,8);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Douglas DC-8-61',119,147000,9);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Antonov An-124-100M',80,405060,10);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Lockheed C-5 Galaxy',131,381000,11);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Boeing 747-200',460,377840,12);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('McDonnell Douglas MD-11',160,273300,13);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Boeing 777F',360,347800,14);
INSERT INTO airplane (airplane_name,airplane_capacity,airplane_weight,airline_code) VALUES ('Airbus A340-300',226,276700,15);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE airport (
    airport_code   NUMBER NOT NULL,
    airport_name   VARCHAR2(50) NOT NULL,
    airport_city   VARCHAR2(50) NOT NULL
);

ALTER TABLE airport ADD CONSTRAINT airport222_pk PRIMARY KEY ( airport_code );

Create sequence airport_seq start with 1;

create or replace TRIGGER T_airport_SEQ
BEFORE INSERT ON airport
FOR EACH ROW
BEGIN
  SELECT airport_seq.NEXTVAL INTO :NEW.airport_code FROM dual;
END;
/

INSERT INTO airport (airport_name,airport_city) VALUES ('Istanbul Airport', 'IST');
INSERT INTO airport (airport_name,airport_city) VALUES ('Frankfurt Airport', 'FRA');
INSERT INTO airport (airport_name,airport_city) VALUES ('Dubai International Airport', 'DXB');
INSERT INTO airport (airport_name,airport_city) VALUES ('Hong Kong International Airport', 'HKG');
INSERT INTO airport (airport_name,airport_city) VALUES ('Heathrow Airport', 'LHR');
INSERT INTO airport (airport_name,airport_city) VALUES ('Amsterdam Airport Schiphol', 'AMS');
INSERT INTO airport (airport_name,airport_city) VALUES ('Denver International Airport', 'DEN');
INSERT INTO airport (airport_name,airport_city) VALUES ('Sarajevo International Airport', 'SJJ');
INSERT INTO airport (airport_name,airport_city) VALUES ('John Paul II Kraków-Balice International Airport', 'KRK');
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE passenger (
    passnger_id       NUMBER NOT NULL,
    pass_first_name   VARCHAR2(50) NOT NULL,
    pass_last_name    VARCHAR2(50) NOT NULL,
    pass_dob          DATE NOT NULL,
    pass_country      VARCHAR2(50) NOT NULL,
    pass_email        VARCHAR2(50),
    pass_phone_no     VARCHAR2(50)
);

ALTER TABLE passenger ADD CONSTRAINT passenger_pk PRIMARY KEY ( passnger_id );

Create sequence passenger_seq start with 1;

create or replace TRIGGER T_passenger_SEQ
BEFORE INSERT ON passenger
FOR EACH ROW
BEGIN
  SELECT passenger_seq.NEXTVAL INTO :NEW.passnger_id FROM dual;
END;
/

INSERT INTO passenger (pass_first_name,pass_last_name,pass_dob,pass_country,pass_email,pass_phone_no) VALUES ('Mohammed', 'Abdulkarim','2-MAY-2021','United Arab Emirates','H00353361@hct.ac.ae','0505930310');
INSERT INTO passenger (pass_first_name,pass_last_name,pass_dob,pass_country,pass_email,pass_phone_no) VALUES ('Abdullah', 'Faisal','2-MAY-2021','United Arab Emirates','H00353197@hct.ac.ae','0567760020');
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE booking (
    booking_id       NUMBER NOT NULL,
    booking_date     DATE NOT NULL,
    booking_ref_no   VARCHAR2(50) NOT NULL,
    passnger_id      NUMBER NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT booking_pk PRIMARY KEY ( booking_id );

Create sequence booking_seq start with 1;

create or replace TRIGGER T_booking_SEQ
BEFORE INSERT ON booking
FOR EACH ROW
BEGIN
  SELECT booking_seq.NEXTVAL INTO :NEW.booking_id FROM dual;
END;
/

INSERT INTO booking (booking_date,booking_ref_no,passnger_id) VALUES ('2-MAY-2021', 'B8XYZ6', 1);
INSERT INTO booking (booking_date,booking_ref_no,passnger_id) VALUES ('2-MAY-2021', 'L5W4NW', 2);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE flight (
    flight_number    NUMBER NOT NULL,
    date_of_flying   DATE NOT NULL,
    departure_time   VARCHAR2(50) NOT NULL,
    arrival_time     VARCHAR2(50) NOT NULL,
    duration         NUMBER NOT NULL,
    airport_code     NUMBER NOT NULL,
    airline_code     NUMBER NOT NULL
);
ALTER TABLE flight ADD CONSTRAINT flight_pk PRIMARY KEY ( flight_number );

Create sequence flight_seq start with 1;

create or replace TRIGGER T_flight_SEQ
BEFORE INSERT ON flight
FOR EACH ROW
BEGIN
  SELECT flight_seq.NEXTVAL INTO :NEW.flight_number FROM dual;
END;
/

INSERT INTO flight (date_of_flying,departure_time,arrival_time,duration,airport_code,airline_code) VALUES ('2-MAY-2021','12:00','19:00',8,1,1);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE flight_instance (
    finst_id        NUMBER NOT NULL,
    dep_date        DATE NOT NULL,
    dep_time        VARCHAR2(50) NOT NULL,
    arr_date        DATE NOT NULL,
    arr_time        VARCHAR2(50) NOT NULL,
    airplane_id     NUMBER NOT NULL,
    flight_number   NUMBER NOT NULL
);

ALTER TABLE flight_instance ADD CONSTRAINT flight_instance_pk PRIMARY KEY ( finst_id );

Create sequence flight_instance_seq start with 1;

create or replace TRIGGER T_flight_instance_SEQ
BEFORE INSERT ON flight_instance 
FOR EACH ROW
BEGIN
  SELECT flight_instance_seq.NEXTVAL INTO :NEW.finst_id FROM dual;
END;
/

INSERT INTO flight_instance (dep_date,dep_time,arr_date,arr_time,airplane_id,flight_number) VALUES ('2-MAY-2021','13:00','12-MAY-2021','20:00',1,1);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ticket (
    ticket_number   NUMBER NOT NULL,
    ticket_price    NUMBER NOT NULL,
    seat_class      VARCHAR2(50) NOT NULL,
    seat_no         VARCHAR2(50) NOT NULL,
    kgs_limit       NUMBER NOT NULL,
    flight_number   NUMBER NOT NULL,
    passnger_id     NUMBER NOT NULL,
    booking_id      NUMBER 
);
ALTER TABLE ticket ADD CONSTRAINT ticket_pk PRIMARY KEY ( ticket_number );

Create sequence ticket_seq start with 1;

create or replace TRIGGER T_ticket_SEQ
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
  SELECT ticket_seq.NEXTVAL INTO :NEW.ticket_number FROM dual;
END;
/

INSERT INTO ticket (ticket_price,seat_class,seat_no,kgs_limit,flight_number,passnger_id,booking_id) VALUES (840,'First-Class','E45',5,1,1,1);
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


ALTER TABLE booking
    ADD CONSTRAINT booking_passenger_fk FOREIGN KEY ( passnger_id )
        REFERENCES passenger ( passnger_id );

ALTER TABLE flight
    ADD CONSTRAINT flight_airline_fk FOREIGN KEY ( airline_code )
        REFERENCES airline ( airline_code );

ALTER TABLE flight
    ADD CONSTRAINT flight_airport_fk FOREIGN KEY ( airport_code )
        REFERENCES airport ( airport_code );

ALTER TABLE flight_instance
    ADD CONSTRAINT flight_instance_airplane_fk FOREIGN KEY ( airplane_id )
        REFERENCES airplane ( airplane_id );

ALTER TABLE flight_instance
    ADD CONSTRAINT flight_instance_flight_fk FOREIGN KEY ( flight_number )
        REFERENCES flight ( flight_number );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_booking_fk FOREIGN KEY ( booking_id )
        REFERENCES booking ( booking_id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_flight_fk FOREIGN KEY ( flight_number )
        REFERENCES flight ( flight_number );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_passenger_fk FOREIGN KEY ( passnger_id )
        REFERENCES passenger ( passnger_id );
