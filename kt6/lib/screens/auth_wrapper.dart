import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

// Обёртка, которая слушает изменения статуса авторизации
class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // Подписка на изменения состояния авторизации пользователя
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Пока происходит инициализация потока — показываем индикатор загрузки
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Если пользователь авторизован — переходим в полноценный режим
        if (snapshot.hasData && snapshot.data != null) {
          return HomeScreen(isGuest: false);
        }

        // Если пользователь не вошёл — показываем интерфейс гостя
        return HomeScreen(isGuest: true);
      },
    );
  }
}
