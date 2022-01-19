const express = require("express");
const app = express();
const queries = require("./queries");

app.use(express.json());

//app.post('/cars',queries.postCar);

app.get("/", queries.getCars);
app.get("/owners", queries.getOwners);

app.listen(3000, () => {
  console.log("listening right now");
});
