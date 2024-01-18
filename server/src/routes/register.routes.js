const router = require('express').Router();
const {
    registerForm,
    showRegister,
} = require('../controllers/registerController');

router.get('/', showRegister);
router.post('/registerForm', registerForm);

module.exports = router;
