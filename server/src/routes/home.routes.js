const router = require('express').Router();
const { showHome } = require('../controllers/homeController');

router.get('/', showHome);

module.exports = router;
