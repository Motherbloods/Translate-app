const express = require("express");
const router = express.Router();
const { translate } = require("../controllers/translate.controller");
router.post("/translate", translate);
module.exports = router;
