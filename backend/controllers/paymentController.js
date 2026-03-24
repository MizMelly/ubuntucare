const interswitchService = require('../services/interswitchService');

exports.initiatePayment = async (req, res) => {
  try {
    const { amount, email, fullName } = req.body;
    const transactionRef = `MH-${Date.now()}`;

    const result = await interswitchService.initiatePayment({
      amount,
      customerEmail: email,
      customerName: fullName,
      transactionRef,
    });

    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: error.message });
  }
};