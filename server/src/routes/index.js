const express = require('express');
const router = express.Router();

const home = require('./home.routes.js');

router.use('/', home);

module.exports = router;
