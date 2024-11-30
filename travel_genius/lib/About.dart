import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About TravelGenius'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo
            Center(
              child: SizedBox(
                height: 150,
                child: Image.asset('assets/images/logo.jpg'), // Add your logo image path here
              ),
            ),
            const SizedBox(height: 20),
            // Introduction Section
            const Text(
              'Welcome to TravelGenius!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'TravelGenius is your ultimate travel companion. We help you explore the world by providing personalized recommendations, detailed destination guides, and real-time weather updates. Whether you are planning your next vacation or looking for hidden gems nearby, TravelGenius has got you covered.',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            // Features Section
            const Text(
              'Key Features:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 10),
            const BulletPoint(text: 'Personalized travel recommendations'),
            const BulletPoint(text: 'Weather and climate updates'),
            const BulletPoint(text: 'Environmental insights'),
            const BulletPoint(text: 'Comprehensive destination guides'),
            const BulletPoint(text: 'Seamless user experience across devices'),
            const SizedBox(height: 20),
            // Mission Section
            const Text(
              'Our Mission:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 10),
            const Text(
              'At TravelGenius, our mission is to make travel planning simple and enjoyable for everyone. We believe that traveling enriches lives, broadens perspectives, and creates lasting memories. By harnessing advanced data and insights, we aim to inspire and empower travelers around the globe.',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),
            // Contact App Information
            const Text(
              'Contact Us: (app information only)',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),
            ),
            const SizedBox(height: 10),
            const Text(
              'Email: TravelG@App.lk\nPhone:+94712856535\nAddress: 323,Galle road kaluwella,Sri lanka',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900], // Dark background for better contrast
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.deepOrange, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
