import 'package:flutter/material.dart';

class ElectricityScreen extends StatelessWidget {
  const ElectricityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2C1C4C);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Electricity"),
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Meter Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            const TextField(
              decoration: InputDecoration(
                labelText: "Amount",
                prefixText: "₦ ",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text("Pay Bill"),
            )
          ],
        ),
      ),
    );
  }
}