import 'package:flutter/material.dart';
import 'pages/bottom_nav.dart';
import 'pages/credit_card.dart';
import 'pages/portfolio.dart';
import 'pages/revenue.dart';

void main() {
  runApp(const MaterialApp(home: BankUI()));
}

class BankUI extends StatefulWidget {
  const BankUI({super.key});

  @override
  State<BankUI> createState() => _BankUIState();
}

class _BankUIState extends State<BankUI> {
  int selectedBottomIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F7FA),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFE8B4CB),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.person,
              color: Color(0xFF8B4A6B),
              size: 24.0,
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(10),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.shuffle),
              color: Colors.grey,
              iconSize: 24.0,
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.all(8.0),
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(10),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 6,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Credit Card Section
            const CreditCardSection(),
            SizedBox(height: 20),

            //  Revenue Section
            RevenueSection(),
            SizedBox(height: 20),

            // Navigation Bar
            BottomNavigationSection(
              selectedIndex: selectedBottomIndex,
              onItemTapped: (index) {
                setState(() {
                  selectedBottomIndex = index;
                });
              },
            ),
            SizedBox(height: 20),

            // Portfolio Section
            Expanded(child: PortfolioSection()),
          ],
        ),
      ),
    );
  }
}



