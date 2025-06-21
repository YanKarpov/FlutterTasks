import 'package:flutter/material.dart';
import 'data/repository/counter_repository_impl.dart';
import 'domain/usecase/increment_counter.dart';
import 'presentation/wm/home_wm.dart';
import 'presentation/screen/home_screen.dart';
import 'package:elementary/elementary.dart';

import './presentation/wm/app_model.dart';

void main() {
  final counterRepo = CounterRepositoryImpl();
  final incrementUseCase = IncrementCounter(counterRepo);

  runApp(MyApp(
    wmFactory: (context) => HomeWM(
      counterRepo.getCounter(),
      incrementUseCase,
      AppModel(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final WidgetModelFactory<HomeWM> wmFactory;

  const MyApp({required this.wmFactory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elementary MVVM',
      home: HomeScreen(wmFactory: wmFactory),
    );
  }
}
