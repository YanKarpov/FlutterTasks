import '../entity/counter.dart';

abstract class CounterRepository {
  Counter getCounter();
  void incrementCounter();
}
