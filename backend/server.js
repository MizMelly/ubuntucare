// server.js
const express = require('express');
const cors = require('cors');
require('dotenv').config();

const authRoutes = require('./routes/authRoutes');
const transactionRoutes = require('./routes/transactionRoutes');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/transactions', transactionRoutes);   

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Micro Health Backend running on http://localhost:${PORT}`);
});