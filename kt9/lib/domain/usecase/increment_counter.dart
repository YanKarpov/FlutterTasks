import '../repository/counter_repository.dart';

class IncrementCounter {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  void call() {
    repository.incrementCounter();
  }
}
