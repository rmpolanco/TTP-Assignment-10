CREATE DATABASE CarDataBase;

\c cardatabase;

CREATE TABLE Car(
    car_id int PRIMARY KEY,
    brand varchar(20), --FOREIGN KEY,
    model_year int,
    model varchar(20),
    color varchar(20)
);

CREATE TABLE CarOwner(
    owner_id int PRIMARY KEY,
    car_id int, --FOREIGN KEY,
    owner_name varchar(30),
    dob date, 
    phone varchar(20),
    owner_address varchar(255)
);

CREATE TABLE Purchase(
    purchase_id int PRIMARY KEY,
    car_id int, --FOREIGN KEY,
    owner_id int, --FOREIGN KEY,
    brand varchar(20), --FOREIGN KEY,
    cost int

);

CREATE TABLE Dealer(
    brand varchar(20) PRIMARY KEY,
    city varchar(255), 
    car_type varchar(20), 
    revenue bigint,
    employees int
);

insert into Car values(1, 'Nissan', 1999, 'Altima', 'Blue'),
(2, 'Toyota', 2012, 'Camry', 'Red');

insert into CarOwner values(1, 1, 'Jerry'),
(2, 2, 'Tom');