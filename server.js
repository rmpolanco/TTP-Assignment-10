const express = require("express");
const app = express();
const queries = require("./queries");

// express version of body-parser
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// queries to retrieve and create car data
app.get(["/", "/cars"], queries.getCars);
app.post("/cars/:carId", queries.postCar);

// queries to retrieve and create owner data
app.get("/owners", queries.getOwners);
app.post("/owners/:ownerId", queries.postOwner);

// queries to retrieve and create dealer data
app.get("/dealers", queries.getDealers);
app.post("/dealers/:dealerId", queries.postDealer);

// queries to retrieve and create car purchase data
app.get("/purchases", queries.getPurchases);
app.post("/purchases/:purchaseId", queries.postPurchase);

// queries to retrieve data from joined tables
app.get("/join/two", queries.getOwnerCar);
app.get("/join/three", queries.getDealerOwnerCar);
app.get("/join/four", queries.getDealerOwnerPurchaseCar);

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Listenting on Port: ${PORT}`);
});
