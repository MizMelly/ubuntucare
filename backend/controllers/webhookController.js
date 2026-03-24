const db = require("../db");

exports.handleWebhook = async (req, res) => {
  const { reference, status } = req.body;

  try {
    if (status === "SUCCESSFUL") {
      // ✅ Update transaction
      await db.query(
        `UPDATE transactions 
         SET status = 'success'
         WHERE reference = $1`,
        [reference]
      );

      // ✅ Balance will update automatically (your trigger 🔥)
    }

    res.sendStatus(200);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
};