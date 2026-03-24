const express = require('express');
const router = express.Router();
const auth = require('../middleware/auth');
const { createTransaction, getTransactions, getBalance } = require('../controllers/transactionController');

router.post('/', auth, createTransaction);
router.get('/', auth, getTransactions);
router.get('/balance', auth, getBalance);

module.exports = router;   