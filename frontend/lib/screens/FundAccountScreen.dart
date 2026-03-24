import 'package:flutter/material.dart';

class FundAccountScreen extends StatefulWidget {
  const FundAccountScreen({super.key});

  @override
  State<FundAccountScreen> createState() => _FundAccountScreenState();
}

class _FundAccountScreenState extends State<FundAccountScreen> {
  String method = "Card";

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2C1C4C);
    const secondary = Color(0xFF4C1D95);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Fund Account"),
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔥 METHOD SELECTOR
            Row(
              children: [
                _methodButton("Card"),
                const SizedBox(width: 10),
                _methodButton("Transfer"),
              ],
            ),

            const SizedBox(height: 20),

            // 🔽 SHOW DIFFERENT UI
            if (method == "Card") ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: "Card Number",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              const TextField(
                decoration: InputDecoration(
                  labelText: "Expiry Date",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              const TextField(
                decoration: InputDecoration(
                  labelText: "CVV",
                  border: OutlineInputBorder(),
                ),
              ),
            ] else ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Bank Name: Build Bank"),
                    Text("Account Number: 1234567890"),
                    Text("Account Name: Precious User"),
                  ],
                ),
              )
            ],

            const SizedBox(height: 20),

            // AMOUNT
            const TextField(
              decoration: InputDecoration(
                labelText: "Amount",
                prefixText: "₦ ",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            // BUTTON
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [primary, secondary],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Fund Wallet",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _methodButton(String title) {
    final isActive = method == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => method = title);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF2C1C4C) : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}