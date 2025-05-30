import 'dart:math';
import 'package:flutter/material.dart';

// Экран игры "Угадай число"
class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _controller = TextEditingController(); // контроллер ввода
  late int _target;        // загаданное число
  String _message = '';    // сообщение пользователю
  int _tries = 0;          // количество попыток

  @override
  void initState() {
    super.initState();
    _target = Random().nextInt(100) + 1; // загадываем число от 1 до 100
  }

  // Проверка введённого числа
  void _checkGuess() {
    final guess = int.tryParse(_controller.text); // пробуем преобразовать ввод в число
    if (guess == null) {
      setState(() => _message = 'Введите корректное число!');
      return;
    }

    _tries++; // увеличиваем счётчик попыток

    // Подсказки пользователю
    if (guess < _target) {
      setState(() => _message = 'Больше!');
    } else if (guess > _target) {
      setState(() => _message = 'Меньше!');
    } else {
      setState(() => _message = 'Угадал за $_tries попыток!');
    }
    _controller.clear(); 
  }

  // Сброс игры
  void _restart() {
    setState(() {
      _controller.clear();
      _message = '';
      _tries = 0;
      _target = Random().nextInt(100) + 1;  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Угадай число')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Загадано число от 1 до 100'),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Ваше предположение'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 12),
            ElevatedButton(onPressed: _checkGuess, child: Text('Проверить')),
            SizedBox(height: 12),
            Text(_message, style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _restart, child: Text('Начать заново')),
          ],
        ),
      ),
    );
  }
}
