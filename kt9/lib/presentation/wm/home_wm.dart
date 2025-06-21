import 'package:elementary/elementary.dart';
import '../../domain/usecase/increment_counter.dart';
import '../../domain/entity/counter.dart';
import '../screen/home_screen.dart';
import 'package:elementary/src/core.dart';
import 'package:state_notifier/state_notifier.dart';


class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier(int initialValue) : super(initialValue);

  void setValue(int value) {
    state = value;
  }

  void increment() {
    state++;
  }
}

class HomeWM extends WidgetModel<HomeScreen, ElementaryModel> {
  final Counter counter;
  final IncrementCounter incrementCounter;

  final CounterStateNotifier counterState;

  HomeWM(
    this.counter,
    this.incrementCounter,
    ElementaryModel model,
  )  : counterState = CounterStateNotifier(counter.value),
       super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    counterState.setValue(counter.value);
  }

  void increment() {
    incrementCounter();
    counterState.setValue(counter.value);
  }
}
