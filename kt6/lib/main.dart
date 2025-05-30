import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Гарантируем инициализацию Flutter перед Firebase
  await Firebase.initializeApp(); // Инициализация Firebase
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth App', 
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), 
      ),
      home: AuthWrapper(), // Обёртка для переключения между гостем и авторизованным пользователем
    );
  }
}
