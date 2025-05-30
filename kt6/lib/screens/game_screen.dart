import 'dart:math';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _controller = TextEditingController();
  late int _target;
  String _message = '';
  int _tries = 0;

  @override
  void initState() {
    super.initState();
    _target = Random().nextInt(100) + 1;
  }

  void _checkGuess() {
    final guess = int.tryParse(_controller.text);
    if (guess == null) {
      setState(() => _message = 'Введите корректное число!');
      return;
    }

    _tries++;

    if (guess < _target) {
      setState(() => _message = 'Больше!');
    } else if (guess > _target) {
      setState(() => _message = 'Меньше!');
    } else {
      setState(() => _message = 'Угадал за $_tries попыток!');
    }
    _controller.clear();
  }

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
