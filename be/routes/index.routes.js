const express = require("express");
const router = express.Router();
const { translate } = require("../controllers/translate.controller");
const { handleGoogleAction } = require("../controllers/google.controller");
router.post("/translate", translate);
router.post("/webhook", handleGoogleAction);
module.exports = router;
