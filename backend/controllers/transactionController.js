const pool = require('../config/db');

exports.getBalance = async (req, res) => {
  try {
    const result = await pool.query('SELECT current_balance FROM users WHERE id = $1', [req.user.id]);
    res.json({ current_balance: result.rows[0].current_balance });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.createTransaction = async (req, res) => {
  const { amount, transaction_type, description } = req.body;
  const userId = req.user.id;

  try {
    const userRes = await pool.query('SELECT current_balance FROM users WHERE id = $1', [userId]);
    let balance = parseFloat(userRes.rows[0].current_balance);

    const newBalance = transaction_type === 'deposit' || transaction_type === 'savings'
      ? balance + parseFloat(amount)
      : balance - parseFloat(amount);

    const result = await pool.query(
      `INSERT INTO transactions (user_id, amount, transaction_type, description, balance_after)
       VALUES ($1, $2, $3, $4, $5) RETURNING *`,
      [userId, amount, transaction_type, description, newBalance]
    );

    res.status(201).json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

exports.getTransactions = async (req, res) => {
  try {
    const result = await pool.query(
      'SELECT * FROM transactions WHERE user_id = $1 ORDER BY created_at DESC LIMIT 20',
      [req.user.id]
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};