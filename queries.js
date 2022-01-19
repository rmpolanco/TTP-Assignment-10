const Pool = require("pg").Pool;
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "cardatabase",
  password: "",
  port: 5432,
});

const getCars = (req, res) => {
  pool.query("select * from car", (error, results) => {
    if (error) {
      throw error;
    } else {
      res.status(200).send(results.rows);
    }
  });
};

// const postCar = (req, res) => {
//   let id = req.params.id
//   let brand = req.body.brand
//   let modelyear = req.body.model_year
//   let model = req.body.model
//   let color = req.body.color
//   pool.query('insert into car(car_id,brand,model_year,model,color)values($1,$2,$3,$4,$5)',[id,brand,modelyear,model,color],(error, results) => {
//     if (error) {
//       throw error;
//     } else {
//       res.status(200).send("Created new car!");
//     }
//   });
// };

const getOwners = (req, res) => {
  pool.query("select * from carowner", (error, results) => {
    if (error) {
      throw error;
    } else {
      res.status(200).send(results.rows);
    }
  });
};

module.exports = {
  getCars,
  getOwners,
  //postCar
};
