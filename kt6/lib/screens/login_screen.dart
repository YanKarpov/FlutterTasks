import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Контроллеры для ввода email и пароля
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String error = ''; // Сообщение об ошибке (если есть)

  // Функция входа в аккаунт
  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // После успешного входа — возврат на предыдущий экран
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      // Отображение сообщения об ошибке при неудаче
      setState(() => error = e.message ?? 'Ошибка входа');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Вход')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Поле ввода email
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // Поле ввода пароля
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Пароль'),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            // Кнопка входа
            ElevatedButton(onPressed: login, child: Text('Войти')),
            // Переход на экран регистрации
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => RegisterScreen()),
                );
              },
              child: Text('Нет аккаунта? Регистрируйся!'),
            ),
            // Отображение ошибки, если она есть
            if (error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(error, style: TextStyle(color: Colors.red)),
              ),
          ],
        ),
      ),
    );
  }
}
