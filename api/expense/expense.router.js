const controller = require("./expense.controller");
const router = require("express").Router();

router.post("/", controller.create);
router.put("/id/", controller.update);
router.get("/id", controller.getAll);
router.delete("/id", controller.delete);

module.exports = router;