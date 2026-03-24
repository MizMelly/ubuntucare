import 'package:flutter/material.dart';

class AirtimeDataScreen extends StatefulWidget {
  const AirtimeDataScreen({super.key});

  @override
  State<AirtimeDataScreen> createState() => _AirtimeDataScreenState();
}

class _AirtimeDataScreenState extends State<AirtimeDataScreen> {
  String selectedNetwork = "MTN";

  final networks = ["MTN", "Airtel", "Glo", "9mobile"];

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF2C1C4C);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Airtime & Data"),
        backgroundColor: primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // 🔥 NETWORK SELECTOR
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: networks.map((network) {
                final isSelected = selectedNetwork == network;

                return GestureDetector(
                  onTap: () {
                    setState(() => selectedNetwork = network);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isSelected ? primary : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      network,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            // PHONE INPUT
            const TextField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 15),

            // AMOUNT
            const TextField(
              decoration: InputDecoration(
                labelText: "Amount",
                prefixText: "₦ ",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 25),

            // BUTTON
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text("Buy Airtime"),
            )
          ],
        ),
      ),
    );
  }
}