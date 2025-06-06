import 'package:flutter/material.dart';
import '../models/cat_fact.dart';
import '../services/cat_fact_service.dart';

// Экран с фактом о котах
class CatFactPage extends StatefulWidget {
  const CatFactPage({super.key});

  @override
  State<CatFactPage> createState() => _CatFactPageState();
}

class _CatFactPageState extends State<CatFactPage> {
  late Future<CatFact> _catFactFuture;
  final CatFactService _service = CatFactService(); // Сервис получения факта

  @override
  void initState() {
    super.initState();
    _catFactFuture = _service.fetchCatFact(); // Загружаем первый факт при старте
  }

  void _refreshFact() {
    // Обновление факта при нажатии кнопки
    setState(() {
      _catFactFuture = _service.fetchCatFact();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🐱 Cat Fact')), // Заголовок
      body: FutureBuilder<CatFact>(
        future: _catFactFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Загрузка
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Ошибка
            return Center(
              child: Text(
                'Ошибка: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData) {
            // Пустой результат
            return const Center(child: Text('No information :('));
          } else {
            // Успешный результат
            final fact = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fact.fact,
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _refreshFact, // Кнопка обновления
                    icon: const Icon(Icons.refresh),
                    label: const Text('Another fact'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
