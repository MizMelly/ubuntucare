import 'package:flutter/material.dart';
import 'AirtimeDataScreen.dart';
import 'FundAccountScreen.dart';
import 'electricity_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onGoToSave;

  const HomeScreen({super.key, required this.onGoToSave});

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;

    const primaryDark = Color(0xFF2C1C4C);
    const secondaryDark = Color(0xFF4C1D95);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ================= HEADER =================
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, isWeb ? 30 : 25, 20, isWeb ? 80 : 65),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [primaryDark, secondaryDark],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello Precious",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Build bank • 906845367",
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFFD8B4FE),
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.notifications_none, color: secondaryDark),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // ================= BALANCE =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [primaryDark, secondaryDark],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Current Balance",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFFD8B4FE),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "₦4,570.80",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4C1D95),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ================= QUICK ACTIONS =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    _quickAction(context,Icons.account_balance_wallet, "Quick Save"),
                    _quickAction(context,Icons.account_balance_wallet, "Fund Account"),
                    _quickAction(context,Icons.phone_android, "Airtime & Data"),
                    _quickAction(context,Icons.receipt_long, "Electricity"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= TITLE =================
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "We have kept our promise",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryDark,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ================= HEALTH =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: isWeb ? 4 : 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: isWeb ? 1.05 : 1.25,
                  children: [
                    _healthCard(Icons.savings, "Daily Savings", "Save from ₦50/day"),
                    _healthCard(Icons.medical_services, "Doctor on Call", "24/7 access"),
                    _healthCard(Icons.local_hospital, "Hospital Coverage", "Free visits"),
                    _healthCard(Icons.people, "Family Shield", "Protect loved ones"),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= TRANSACTIONS =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: primaryDark,
                      ),
                    ),
                    Text(
                      "See all",
                      style: TextStyle(color: secondaryDark),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _transactionTile("Apple Inc.", "₦8,000.00"),
                    _transactionTile("Adobe", "₦8,000.00"),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ================= QUICK ACTION =================
Widget _quickAction(BuildContext context, IconData icon, String label) {
  return GestureDetector(
    onTap: () {
      if (label == "Quick Save") {
        onGoToSave();
      } else if (label == "Fund Account") {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const FundAccountScreen()));
      } else if (label == "Airtime & Data") {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AirtimeDataScreen()));
      } else if (label == "Electricity") {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const ElectricityScreen()));
      }
    },
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: const BoxDecoration(
            color: Color(0xFF4C1D95),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    ),
  );
}
  // ================= HEALTH CARD =================
  Widget _healthCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2C1C4C), Color(0xFF4C1D95)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, color: Colors.transparent),
          const Spacer(),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Color(0xFFD8B4FE))),
        ],
      ),
    );
  }

  // ================= TRANSACTION =================
  Widget _transactionTile(String title, String amount) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color(0xFF4C1D95),
        child: Text("A", style: TextStyle(color: Colors.white)),
      ),
      title: Text(title),
      subtitle: const Text("21 Sep, 03:02 PM"),
      trailing: Text(amount),
    );
  }
}