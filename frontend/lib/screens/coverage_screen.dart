import 'package:flutter/material.dart';

class CoverageScreen extends StatelessWidget {
  const CoverageScreen({super.key});

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
        title: const Text("Coverage", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: true,
        actions: const [Padding(padding: EdgeInsets.only(right: 12), child: Icon(Icons.settings, color: Colors.white))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    color: primaryDark,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  ),
                ),
                Positioned(
                  bottom: -1, left: 0, right: 0,
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(color: Color(0xFFF5F3FF), borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
                  ),
                ),
                Positioned(
                  left: 16, right: 16, bottom: -70,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(colors: [Color(0xFFEDE9FE), Color(0xFFF5F3FF)]),
                      boxShadow: [BoxShadow(color: primaryDark.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 6))],
                    ),
                    child: Column(
                      children: [
                        const Text("You are on Level 3", style: TextStyle(fontSize: 14, color: primaryDark)),
                        const SizedBox(height: 6),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(text: "₦4,850 ", style: TextStyle(color: primaryDark, fontSize: 22, fontWeight: FontWeight.bold)),
                            TextSpan(text: "Saved", style: TextStyle(color: Color(0xFF7C3AED), fontSize: 14)),
                          ]),
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const LinearProgressIndicator(value: 0.65, minHeight: 10, backgroundColor: Color(0xFFEDE9FE), valueColor: AlwaysStoppedAnimation(secondaryDark)),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.home, size: 14, color: secondaryDark),
                            SizedBox(width: 4),
                            Text("₦850 more to unlock Telemedicine", style: TextStyle(fontSize: 12, color: primaryDark)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Milestone Progress", style: TextStyle(fontWeight: FontWeight.w600, color: primaryDark)),
                        const Divider(),
                        _milestone(Icons.check, "Level 1  Basic Care", secondaryDark),
                        _milestone(Icons.check, "Level 2  Consultation", secondaryDark),
                        _milestone(Icons.lock, "Level 3  Telemedicine", Colors.orange, highlight: true),
                        _milestone(Icons.lock, "Level 4  Hospital Visit", Colors.grey),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Family Covered", style: TextStyle(fontWeight: FontWeight.w600, color: primaryDark)),
                        const SizedBox(height: 10),
                        _familyTile("Mom", "Covered", "Yesterday", secondaryDark),
                        const Divider(),
                        _familyTile("Son", "Partial", "22 Apr", Colors.orange),
                      ],
                    ),
                  ),
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
      width: double.infinity, padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: primaryDark.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))]),
      child: child,
    );
  }

  Widget _milestone(IconData icon, String text, Color color, {bool highlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(color: highlight ? const Color(0xFFEDE9FE) : Colors.transparent, borderRadius: BorderRadius.circular(8)),
      child: Row(children: [Icon(icon, color: color, size: 20), const SizedBox(width: 10), Text(text, style: const TextStyle(color: primaryDark))]),
    );
  }

  Widget _familyTile(String name, String status, String date, Color color) {
    return Row(children: [
      CircleAvatar(radius: 18, backgroundColor: const Color(0xFFEDE9FE), child: Icon(Icons.person, color: secondaryDark, size: 18)),
      const SizedBox(width: 10),
      Expanded(child: Text("$name  $status", style: const TextStyle(color: primaryDark))),
      Text(date, style: const TextStyle(color: lightPurple)),
    ]);
  }
}
