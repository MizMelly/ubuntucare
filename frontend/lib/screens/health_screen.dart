import 'package:flutter/material.dart';

class HealthScreen extends StatelessWidget {
  const HealthScreen({super.key});

  static const primaryDark = Color(0xFF2C1C4C);
  static const secondaryDark = Color(0xFF4C1D95);
  static const lightPurple = Color(0xFFD8B4FE);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3FF),
      appBar: AppBar(
        backgroundColor: primaryDark,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Health",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 0.85,
        children: [
          _card(title: "Telemedicine", subtitle: "Locked", isLocked: true),
          _card(title: "Hospital Visit", buttonText: "Book Now"),
          _emergencyCard(),
          _card(title: "Pharmacy", buttonText: "Refill Now"),
          _card(title: "Health Tips", buttonText: "Learn More"),
          _card(title: "Claims Status", buttonText: "Check Status"),
        ],
      ),
    );
  }

  Widget _card({required String title, String? buttonText, bool isLocked = false, String? subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEDE9FE),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: primaryDark.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Center(child: Icon(Icons.local_hospital, size: 50, color: lightPurple))),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: primaryDark)),
          const SizedBox(height: 6),
          if (isLocked)
            Row(children: [
              const Icon(Icons.lock, size: 14, color: secondaryDark),
              const SizedBox(width: 4),
              Text(subtitle ?? "", style: const TextStyle(fontSize: 12, color: secondaryDark)),
            ])
          else if (buttonText != null)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              decoration: BoxDecoration(color: secondaryDark, borderRadius: BorderRadius.circular(8)),
              child: Center(child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 12))),
            ),
        ],
      ),
    );
  }

  Widget _emergencyCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFEF4444), Color(0xFFDC2626)]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.red.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 6))],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Expanded(child: Center(child: Icon(Icons.medical_services, size: 50, color: Colors.white))),
          const Text("Emergency", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
            child: const Center(child: Text("Emergency Help", style: TextStyle(color: Colors.white, fontSize: 12))),
          ),
        ],
      ),
    );
  }
}
