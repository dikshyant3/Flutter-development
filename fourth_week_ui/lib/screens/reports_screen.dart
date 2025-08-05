import 'package:flutter/material.dart';
import 'package:fourth_week_ui/widgets/contact_form.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(185, 162, 162, 211),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,
        color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text(
        'Contact Page',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
      ),
      ),
      centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 16),
            Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32),
            ContactForm(),
            ],
        )
      )
    );
  }
}