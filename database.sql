CREATE DATABASE CarDataBase;

\c cardatabase;


CREATE TABLE Dealer(
    brand varchar(20) PRIMARY KEY,
    city varchar(255), 
    car_type varchar(20), 
    revenue bigint,
    employees int
);
CREATE TABLE Car(
    car_id int PRIMARY KEY,
    brand varchar(20),
    model_year int,
    model varchar(20),
    color varchar(20),
    FOREIGN KEY(brand) references Dealer(brand)
);
CREATE TABLE CarOwner(
    owner_id int PRIMARY KEY,
    car_id int, 
    owner_name varchar(30),
    dob date, 
    phone varchar(20),
    owner_address varchar(255),
    FOREIGN KEY(car_id) references Car(car_id)
);
CREATE TABLE Purchase(
    purchase_id int PRIMARY KEY,
    car_id int, 
    owner_id int, 
    brand varchar(20), 
    cost int,
    FOREIGN KEY(car_id) references Car(car_id),
    FOREIGN KEY(owner_id) references CarOwner(owner_id),
    FOREIGN KEY(brand) references Dealer(brand)
);

insert into Dealer values('Nissan','New York',10000000,100);

insert into Car values(1, 'Nissan', 1999, 'Altima', 'Blue');

insert into CarOwner values(1, 1, 'Jerry');

insert into Purchase values(1, 1, 1, 'Nissan', 10000);


select * from Car 
    inner join CarOwner on CarOwner.car_id = Car.car_id
where Car.car_id = 1;

select * from Car 
    inner join Dealer on Dealer.brand = Car.brand
    inner join CarOwner on CarOwner.car_id = Car.car_id
where Car.car_id = 1;

select * from Car 
    inner join Dealer on Dealer.brand = Car.brand
    inner join CarOwner on CarOwner.car_id = Car.car_id
    inner join Purchase on Purchase.car_id = Car.car_id
where Car.car_id = 1;