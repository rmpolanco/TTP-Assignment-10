const express = require("express");
const app = express();
const queries = require("./queries");

app.get(express.json());

app.get("/", queries.getCars);

app.listen(3000, () => {
  console.log("listening right now");
});
