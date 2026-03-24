import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF16A34A),
        title: const Text(""),
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Color(0xFF16A34A)),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildMenuItem(Icons.group, "My Family"),
            buildMenuItem(Icons.account_balance_wallet, "Wallet"),
            buildMenuItem(Icons.person, "Profile"),
            buildMenuItem(Icons.settings, "Settings"),
            buildMenuItem(Icons.headset_mic, "Support"),
            buildMenuItem(Icons.info, "About"),
            buildMenuItem(Icons.logout, "Logout", isLogout: true),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title,
      {bool isLogout = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF16A34A),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Handle navigation
        },
      ),
    );
  }
}