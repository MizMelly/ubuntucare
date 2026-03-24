const axios = require('axios');
require('dotenv').config();

const BASE_URL = 'https://sandbox.interswitchng.com';

class InterswitchService {
  async getAccessToken() {
    const authString = `${process.env.INTERSWITCH_CLIENT_ID}:${process.env.INTERSWITCH_CLIENT_SECRET}`;
    const base64Auth = Buffer.from(authString).toString('base64');

    const response = await axios.post(
      `${BASE_URL}/api/v3/oauth/token`,
      new URLSearchParams({ grant_type: 'client_credentials', scope: 'payment' }),
      {
        headers: {
          'Authorization': `Basic ${base64Auth}`,
          'Content-Type': 'application/x-www-form-urlencoded'
        }
      }
    );

    return response.data.access_token;
  }

  async initiatePayment({ amount, customerEmail, customerName, transactionRef }) {
    const token = await this.getAccessToken();

    const payload = {
      amount: Math.round(amount * 100),
      currency: "NGN",
      customerEmail,
      customerName,
      transactionReference: transactionRef,
      redirectUrl: "https://yourapp.com/payment-success",   // Change this later
    };

    const response = await axios.post(
      `${BASE_URL}/api/v3/payments`,
      payload,
      {
        headers: {
          'Authorization': `Bearer ${token}`,
          'Content-Type': 'application/json'
        }
      }
    );

    console.log("✅ Interswitch Response:", response.data);

    const paymentLink = response.data.payLink || response.data.checkoutUrl || response.data.paymentLink;

    if (!paymentLink) throw new Error("No payment link received from Interswitch");

    return { success: true, paymentLink, transactionRef };
  }
}

module.exports = new InterswitchService();