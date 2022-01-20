CREATE DATABASE CarDataBase;

\c cardatabase -- psql change to database

CREATE TABLE Dealer(
    brand VARCHAR(20) PRIMARY KEY,
    city VARCHAR(255), 
    car_type VARCHAR(20), 
    revenue BIGINT,
    employees INTEGER
);

CREATE TABLE Car(
    car_id INTEGER PRIMARY KEY,
    brand VARCHAR(20),
    model_year INTEGER,
    model VARCHAR(20),
    color VARCHAR(20),
    FOREIGN KEY(brand) REFERENCES Dealer(brand)
);

CREATE TABLE CarOwner(
    owner_id INTEGER PRIMARY KEY,
    car_id INTEGER, 
    owner_name VARCHAR(30),
    phone VARCHAR(20),
    owner_address VARCHAR(255),
    FOREIGN KEY(car_id) REFERENCES Car(car_id)
);

CREATE TABLE Purchase(
    purchase_id INTEGER PRIMARY KEY,
    car_id INTEGER, 
    owner_id INTEGER, 
    brand VARCHAR(20), 
    cost INTEGER,
    FOREIGN KEY(car_id) REFERENCES Car(car_id),
    FOREIGN KEY(owner_id) REFERENCES CarOwner(owner_id),
    FOREIGN KEY(brand) REFERENCES Dealer(brand)
);

INSERT INTO Dealer VALUES('Nissan', 'New York', 'sedan', 10000000, 100);
INSERT INTO Dealer VALUES('Honda', 'New York', 'SUV', 1000000000, 500);
INSERT INTO Dealer VALUES('Mazda', 'California', 'sedan', 6432456112, 1000);

INSERT INTO Car VALUES(1, 'Nissan', 1999, 'Altima', 'Blue');
INSERT INTO Car VALUES(2, 'Honda', 2005, 'Accord', 'Red');
INSERT INTO Car VALUES(3, 'Mazda', 2021, 'crv', 'black');

INSERT INTO CarOwner VALUES(1, 1, 'Jerry', '555-555-5555', 'chelsea');
INSERT INTO CarOwner VALUES(2, 2, 'Bob', '123-456-7890', 'st marks');
INSERT INTO CarOwner VALUES(3, 3, 'Gunther', '777-777-8888', 'brooklyn');

INSERT INTO Purchase VALUES(1, 1, 1, 'Nissan', 10000);
INSERT INTO Purchase VALUES(2, 2, 2, 'Honda', 23434);
INSERT INTO Purchase VALUES(3, 3, 3, 'Mazda', 44532);


SELECT * FROM Car 
    INNER JOIN CarOwner ON CarOwner.car_id = Car.car_id;

SELECT * FROM Car 
    INNER JOIN Dealer ON Dealer.brand = Car.brand
    INNER JOIN CarOwner ON CarOwner.car_id = Car.car_id;

SELECT * FROM Car 
    INNER JOIN Dealer ON Dealer.brand = Car.brand
    INNER JOIN CarOwner ON CarOwner.car_id = Car.car_id
    INNER JOIN Purchase ON Purchase.car_id = Car.car_id;
