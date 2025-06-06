import 'package:flutter/material.dart';
import 'pages/cat_fact_page.dart';

void main() {
  runApp(const CatFactApp());
}

class CatFactApp extends StatelessWidget {
  const CatFactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Fact',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const CatFactPage(),
    );
  }
}
