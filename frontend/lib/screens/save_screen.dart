import 'package:flutter/material.dart';

class SaveScreen extends StatefulWidget {
  final VoidCallback onBack;

  const SaveScreen({super.key, required this.onBack});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  int selectedAmount = 0;
  bool dailyAutoSave = true;
  bool weeklyAutoSave = false;

  static const primaryDark = Color(0xFF2C1C4C);
  static const secondaryDark = Color(0xFF4C1D95);
  static const lightPurple = Color(0xFFD8B4FE);

  final List<String> amounts = ["₦50", "₦100", "Custom"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      appBar: AppBar(
        backgroundColor: primaryDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: widget.onBack,
        ),
        centerTitle: true,
        title: const Text(
          "Save",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // WALLET CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(colors: [primaryDark, secondaryDark]),
              ),
              child: const Text(
                "Wallet Balance: ₦1200",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),

            // CHOOSE AMOUNT
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Choose Amount",
                      style: TextStyle(fontWeight: FontWeight.w600, color: primaryDark)),
                  const SizedBox(height: 12),
                  Row(
                    children: List.generate(amounts.length, (index) {
                      final isSelected = selectedAmount == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => selectedAmount = index),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected ? secondaryDark : const Color(0xFFEDE9FE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                amounts[index],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : primaryDark,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // AUTO SAVE
            _card(
              child: Column(
                children: [
                  _switchTile("Daily Auto-Save", dailyAutoSave,
                      (val) => setState(() => dailyAutoSave = val)),
                  _divider(),
                  _switchTile("Weekly Auto-Save", weeklyAutoSave,
                      (val) => setState(() => weeklyAutoSave = val)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // PAY BUTTON
            Container(
              width: double.infinity,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(colors: [primaryDark, secondaryDark]),
              ),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: const Text("Payment Successful"), backgroundColor: secondaryDark),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: const Text("Pay Now",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),

            // PAYMENT METHODS
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Payment Methods",
                      style: TextStyle(fontWeight: FontWeight.w600, color: primaryDark)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _paymentIcon(Icons.account_balance),
                      _paymentChip("USSD"),
                      _paymentIcon(Icons.account_balance_wallet),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // RECENT TRANSACTIONS
            _card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Recent Transactions",
                      style: TextStyle(fontWeight: FontWeight.w600, color: primaryDark)),
                  const SizedBox(height: 12),
                  _transaction("₦100", "Successful", "Yesterday", secondaryDark),
                  _transaction("₦50", "Pending", "22 Apr", Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: child,
    );
  }

  Widget _switchTile(String title, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: primaryDark)),
        Switch(value: value, activeColor: secondaryDark, onChanged: onChanged),
      ],
    );
  }

  Widget _divider() => const Divider(height: 20);

  Widget _paymentIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFEDE9FE), borderRadius: BorderRadius.circular(10)),
      child: Icon(icon, color: secondaryDark),
    );
  }

  Widget _paymentChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFEDE9FE), borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w500, color: primaryDark)),
    );
  }

  Widget _transaction(String amount, String status, String date, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(amount, style: const TextStyle(fontWeight: FontWeight.w600, color: primaryDark)),
          Text(status, style: TextStyle(color: color)),
          Text(date, style: TextStyle(color: lightPurple)),
        ],
      ),
    );
  }
}
