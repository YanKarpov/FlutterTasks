import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Контроллеры для ввода email и пароля
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String error = ''; // Сообщение об ошибке (если есть)

  // Функция регистрации пользователя
  void register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context); // Возврат на предыдущий экран после регистрации
    } on FirebaseAuthException catch (e) {
      // Отображение ошибки, если регистрация не удалась
      setState(() => error = e.message ?? 'Ошибка регистрации');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
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
            // Кнопка регистрации
            ElevatedButton(
              onPressed: register,
              child: Text('Зарегистрироваться'),
            ),
            // Отображение ошибки (если есть)
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
