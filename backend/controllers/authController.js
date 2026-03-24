const pool = require('../config/db');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

// REGISTER
exports.register = async (req, res) => {
  const { full_name, phone_number, email, password } = req.body;

  try {
    // Check if email or phone already exists
    const existingUser = await pool.query(
      'SELECT * FROM users WHERE phone_number = $1 OR email = $2',
      [phone_number, email]
    );
    if (existingUser.rows.length > 0) {
      return res.status(400).json({ message: 'Phone number or email already registered' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const result = await pool.query(
      `INSERT INTO users (full_name, phone_number, email, password_hash)
       VALUES ($1, $2, $3, $4) RETURNING id, full_name, phone_number, email`,
      [full_name, phone_number, email, hashedPassword]
    );

    const user = result.rows[0];

    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '30d' });

    res.status(201).json({ success: true, message: 'Account created', user, token });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// LOGIN (email + password)
exports.login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const result = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
    const user = result.rows[0];

    if (!user || !(await bcrypt.compare(password, user.password_hash))) {
      return res.status(401).json({ success: false, message: 'Invalid email or password' });
    }

    const token = jwt.sign({ id: user.id }, process.env.JWT_SECRET, { expiresIn: '30d' });

    res.status(200).json({
      success: true,
      message: 'Login successful',
      user: {
        id: user.id,
        full_name: user.full_name,
        phone_number: user.phone_number,
        email: user.email,
        current_balance: user.current_balance || 0,
      },
      token,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: 'Server error' });
  }
};

// FORGOT PASSWORD (placeholder)
exports.forgotpassword = async (req, res) => {
  const { email } = req.body;

  res.status(200).json({
    success: true,
    message: `Password reset link sent to ${email} (not implemented yet)`,
  });
};