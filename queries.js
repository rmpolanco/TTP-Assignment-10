const Pool = require("pg").Pool;
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "cardatabase",
  password: "PostgreS6money",
  port: 5432,
});

/* car queries */
const getCars = (req, res) => {
  pool.query("SELECT * FROM car", (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).send(results.rows);
  });
};

const postCar = (req, res) => {
  let id = req.params.carId;
  let brand = req.body.brand;
  let modelyear = req.body.model_year;
  let model = req.body.model;
  let color = req.body.color;
  pool.query(
    "INSERT INTO car(car_id, brand, model_year, model, color) VALUES($1, $2, $3, $4, $5)",
    [id, brand, modelyear, model, color],
    (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).send("Created new car!");
    }
  );
};

/* owner queries */
const getOwners = (req, res) => {
  pool.query("SELECT * FROM carowner", (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).send(results.rows);
  });
};

const postOwner = (req, res) => {
  const id = req.params.ownerId;
  const carId = req.body.car_id;
  const name = req.body.owner_name;
  const number = req.body.phone;
  const address = req.body.owner_address;
  pool.query(
    "INSERT INTO carowner(owner_id, car_id, owner_name, phone, owner_address) VALUES($1, $2, $3, $4, $5)",
    [id, carId, name, number, address],
    (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).send(`New owner ${name} was added`);
    }
  );
};

/* dealer queries */
const getDealers = (req, res) => {
  pool.query("SELECT * FROM dealer", (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).send(results.rows);
  });
};

const postDealer = (req, res) => {
  const brand = req.params.dealerId;
  const city = req.body.city;
  const carType = req.body.car_type;
  const revenue = req.body.revenue;
  const employees = req.body.employees;
  pool.query(
    "INSERT INTO dealer(brand, city, car_type, revenue, employees) VALUES($1, $2, $3, $4, $5)",
    [brand, city, carType, revenue, employees],
    (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).send(`New dealer for ${brand} was added`);
    }
  );
};

/* purhcase queries */
const getPurchases = (req, res) => {
  pool.query("SELECT * FROM purchase", (error, results) => {
    if (error) {
      throw error;
    }
    res.status(200).send(results.rows);
  });
};

const postPurchase = (req, res) => {
  const id = req.params.purchaseId;
  const carId = req.body.car_id;
  const ownerId = req.body.owner_id;
  const brand = req.body.brand;
  const cost = req.body.cost;
  pool.query(
    "INSERT INTO purchase(purchase_id, car_id, owner_id, brand, cost) VALUES($1, $2, $3, $4, $5)",
    [id, carId, ownerId, brand, cost],
    (error, results) => {
      if (error) {
        throw error;
      }
      res.status(200).send(`New purchase transcation was recorded`);
    }
  );
};

/* joins */
const getOwnerCar = (req, res) => {
  pool.query(
    "SELECT * FROM car INNER JOIN carowner ON carowner.car_id = car.car_id",
    (error, results) => {
      if (error) {
        throw error;
      }
      res.send(results.rows);
    }
  );
};

const getDealerOwnerCar = (req, res) => {
  pool.query(
    "SELECT * FROM car INNER JOIN dealer ON dealer.brand = car.brand INNER JOIN carowner ON carowner.car_id = car.car_id",
    (error, results) => {
      if (error) {
        throw error;
      }
      res.send(results.rows);
    }
  );
};

const getDealerOwnerPurchaseCar = (req, res) => {
  pool.query(
    "SELECT * FROM car INNER JOIN dealer ON dealer.brand = car.brand INNER JOIN carowner ON carowner.car_id = car.car_id INNER JOIN purchase ON purchase.car_id = car.car_id",
    (error, results) => {
      if (error) {
        throw error;
      }
      res.send(results.rows);
    }
  );
};

module.exports = {
  getCars,
  getOwners,
  postCar,
  postOwner,
  getDealers,
  postDealer,
  getPurchases,
  postPurchase,
  getOwnerCar,
  getDealerOwnerCar,
  getDealerOwnerPurchaseCar,
};
