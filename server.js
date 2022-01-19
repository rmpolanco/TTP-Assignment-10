const express = require("express");
const app = express();

const queries = require("./queries");

app.get("/", (queries.getCars))

app.listen(3000, (req, res) => {
    console.log("listening right now")
})