import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
          children: [
            // Profile icon
            const Icon(Icons.account_circle, size: 120, color: Colors.orange),
            const SizedBox(height: 16),

            // User name
            const Text(
              'Johny Deep',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            Text(
              'Position: Flutter Developer',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),

            Text(
              'Email:  Example@gmail.com',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            Text(
              'Phone:  123-456-7890',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
            Text(
              'Address: 123 Main St, City, Country',
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
