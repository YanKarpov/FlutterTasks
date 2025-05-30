import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'game_screen.dart'; // Импортируем экран с игрой

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Добро пожаловать, ${user?.email ?? 'пользователь'}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Переход на экран игры
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text('Играть в угадай число'),
            ),
          ],
        ),
      ),
    );
  }
}
