import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/save_screen.dart';
import 'screens/coverage_screen.dart';
import 'screens/health_screen.dart';
import 'screens/more_screen.dart';
import 'screens/login_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getScreen(currentIndex),

      // ==================== EXACT NAVIGATION FROM YOUR PHOTO ====================
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home, 0),
            _navItem(Icons.chat_bubble_outline, 1),
            _walletItem(2),           // Purple circle (Wallet)
            _navItem(Icons.analytics, 3),
            _navItem(Icons.person_outline, 4),
          ],
        ),
      ),
    );
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen(onGoToSave: () => setState(() => currentIndex = 2));
      case 1:
        return HealthScreen();                    // ← Now points to Health Screen
      case 2:
        return SaveScreen(onBack: () => setState(() => currentIndex = 0));
      case 3:
        return CoverageScreen();
      case 4:
        return MoreScreen();
      default:
        return HomeScreen(onGoToSave: () => setState(() => currentIndex = 2));
    }
  }

  // Normal nav item
  Widget _navItem(IconData icon, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Icon(
        icon,
        size: 28,
        color: isSelected ? const Color(0xFF6D28D9) : Colors.grey,
      ),
    );
  }

  // Purple Wallet button in the middle
  Widget _walletItem(int index) {
    return GestureDetector(
      onTap: () => setState(() => currentIndex = index),
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: const Color(0xFF6D28D9),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6D28D9).withOpacity(0.4),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: const Icon(
          Icons.account_balance_wallet,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}