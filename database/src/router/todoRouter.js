const express = require("express");
const todoController = require("../controller/todoController");

const router = express.Router();

router.route("/todo").post(todoController.todoAdd);
router.route("/todo").get(todoController.todoGetAll);
router.route("/todo/:id").put(todoController.todoUpdate);
router.route("/todo/:id").delete(todoController.todoDelete);
router.route("/todo/:id").get(todoController.todoGet);



module.exports = router;
