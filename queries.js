const Pool = require("pg").Pool;
const pool = new Pool({
  user: "",
  host: "localhost",
  database: "",
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

const getOwners = () => {};

module.exports = {
  getCars,
};
