const express = require('express');
const router = express.Router();

const home = require('./home.routes.js');
const register = require('./register.routes.js');

router.use('/', home);
router.use('/register', register);

module.exports = router;
