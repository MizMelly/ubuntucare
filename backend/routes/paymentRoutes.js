const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const { initiatePayment } = require('../controllers/paymentController');

router.post('/initiate', auth, initiatePayment);

module.exports = router;