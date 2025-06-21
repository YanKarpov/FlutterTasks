import '../../domain/entity/counter.dart';
import '../../domain/repository/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  Counter _counter = Counter(0);

  @override
  Counter getCounter() => _counter;

  @override
  void incrementCounter() {
    _counter.value++;
  }
}
