const express = require('express');
const router = express.Router();
const { register, login, forgotpassword } = require('../controllers/authController');

router.post('/register', register);
router.post('/login', login);
router.post('/forgotpassword', forgotpassword);


module.exports = router;