import 'dart:async';

class CounterBloc {
  int count;
  StreamController streamController;

  CounterBloc() {
    count = 0;
    streamController = StreamController<int>();
  }

  void add() {
    ++count;
    streamController.add(count);
  }

  void sub() {
    --count;
    streamController.add(count);
  }

  void reset() {
    count = 0;
    streamController.add(count);
  }

  Stream<int> get stream => streamController.stream;
}
