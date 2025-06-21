import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import '../wm/home_wm.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

class HomeScreen extends ElementaryWidget<HomeWM> {
  const HomeScreen({Key? key, required WidgetModelFactory<HomeWM> wmFactory})
      : super(wmFactory, key: key);

  @override
  Widget build(HomeWM wm) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meow')),
      body: Center(
        child: StateNotifierBuilder<int>(
          stateNotifier: wm.counterState, 
          builder: (_, value, __) {
            return Text('Counter: $value',
                style: const TextStyle(fontSize: 24));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: wm.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
