import 'package:flutter/material.dart';

void main() {
  runApp(const StaticResourcesApp());
}

class StaticResourcesApp extends StatelessWidget {
  const StaticResourcesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Static Resources App',
      theme: ThemeData(
        fontFamily: 'XI20',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Галерея'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Добро пожаловать!',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Image.asset('assets/images/image1.png'),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/image2.png'),
                  const SizedBox(height: 10),
                  Image.asset('assets/images/image3.png'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}