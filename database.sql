CREATE DATABASE CarDataBase;

\c cardatabase;

CREATE TABLE Car(
    car_id int PRIMARY KEY,
    brand varchar(20),
    model_year int,
    model varchar(20),
    color varchar(20),
    CONSTRAINT fk_dealer
        FOREIGN KEY(brand)
            REFERENCES Dealer(brand)
);

CREATE TABLE CarOwner(
    owner_id int PRIMARY KEY,
    car_id int,
    dob date, 
    gender char,
    phone varchar(20),
    owner_address varchar(255),
    CONSTRAINT fk_Car
        FOREIGN KEY(car_id)
            REFERENCES Car(car_id)
);

CREATE TABLE Purchase(
    purchase_id int PRIMARY KEY,
    car_id int,
    owner_id int,
    brand varchar(20),
    cost int,
    CONSTRAINT fk_Car
        FOREIGN KEY(car_id)
            REFERENCES Car(car_id),
    CONSTRAINT fk_CarOwner
        FOREIGN KEY(owner_id)
            REFERENCES CarOwner(owner_id),
    CONSTRAINT fk_Car
        FOREIGN KEY(car_id)
            REFERENCES Car(car_id),
    CONSTRAINT fk_dealer
        FOREIGN KEY(brand)
            REFERENCES Dealer(brand)

);

CREATE TABLE Dealer(
    brand varchar(20) PRIMARY KEY,
    city varchar(255), 
    car_type varchar(20), 
    revenue bigint,
    employees int
);
