import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'game_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isGuest;

  const HomeScreen({Key? key, this.isGuest = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
        actions: [
          if (!isGuest)
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
            Text('Добро пожаловать, ${isGuest ? 'гость' : user?.email ?? ''}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isGuest) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Требуется вход'),
                      content: Text('Пожалуйста, войдите в аккаунт, чтобы играть.'),
                      actions: [
                        TextButton(
                          child: Text('Отмена'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        TextButton(
                          child: Text('Войти'),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => GameScreen()),
                  );
                }
              },
              child: Text('Играть в угадай число'),
            ),
          ],
        ),
      ),
    );
  }
}
