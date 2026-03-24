const pool = require('../config/db');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

exports.register = async (req, res) => {
  const { full_name, phone_number, email, password } = req.body;

  try {
    const hashed = await bcrypt.hash(password, 10);

    const result = await pool.query(
      `INSERT INTO users (full_name, phone_number, email, password_hash)
       VALUES ($1, $2, $3, $4) RETURNING id, full_name, phone_number`,
      [full_name, phone_number, email, hashed]
    );

    const user = result.rows[0];
    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '30d' });

    res.status(201).json({ message: "Account created", user, token });
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

exports.login = async (req, res) => {
  const { phone_number, password } = req.body;

  const result = await pool.query('SELECT * FROM users WHERE phone_number = $1', [phone_number]);
  const user = result.rows[0];

  if (!user || !(await bcrypt.compare(password, user.password_hash))) {
    return res.status(401).json({ message: 'Invalid phone number or password' });
  }

  const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '30d' });

  res.json({
    message: "Login successful",
    user: {
      id: user.id,
      full_name: user.full_name,
      phone_number: user.phone_number,
      current_balance: user.current_balance
    },
    token
  });
};