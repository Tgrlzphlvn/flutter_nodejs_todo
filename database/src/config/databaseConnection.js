const mongoose = require("mongoose");

mongoose
  .connect("mongodb://localhost:27017/todo-api")
  .then(() => {
    console.log("Bağlantı başarılı");
  })
  .catch((err) => {
    console.log("Bağlantı başarısız -> " + err.message);
  });
