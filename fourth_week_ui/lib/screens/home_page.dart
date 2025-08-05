import 'package:flutter/material.dart';
import 'package:fourth_week_ui/widgets/streak_card.dart';
import 'package:fourth_week_ui/widgets/breathing_card.dart';
// import 'package:fourth_week_ui/widgets/reminder_card.dart';
import 'package:fourth_week_ui/widgets/health_indicator.dart';
import 'package:fourth_week_ui/widgets/navigation.dart';
import 'reports_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  void _onNavigationTap(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Navigate to Reports page when Reports tab is tapped
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ReportsScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F2F7),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  // image: NetworkImage('https://images.unsplash.com/photo-1542362879-8353335123aa?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  image: AssetImage('assets/profile.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 15),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nelia Smith',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Basic Account',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
          ),
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const StreakCard(),
            const SizedBox(height: 20),
            // const ReminderMessage(),
            // const SizedBox(height: 20),
            const HealthIndicators(),
            const SizedBox(height: 20),
            const BreathingCard()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        onTap: _onNavigationTap,
      ),
    );
  }
}
