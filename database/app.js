const express = require("express");
const app = express();
require("dotenv").config();
require("./src/config/databaseConnection");
const todoRouter = require("./src/router/todoRouter");

const port = 3000;

app.use(express.json());
app.use("/api", todoRouter);

app.get("/", (req, res) => {
  res.send("Hoş geldiniz.");
});

app.listen(port, () => {
  console.log("Server ${port} portundan başlatıldı.");
});
