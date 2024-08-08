import 'dart:async';

class CounterBloc {
  int count;
  StreamController<int> countStreamController;
  bool running;

  CounterBloc() {
    running = false;
    count = 0;
    countStreamController =
        StreamController<int>.broadcast(onListen: start, onCancel: stop);
  }

  Stream<int> getCount() {
    return countStreamController.stream;
  }

  start() {
    running = true;

    Future.doWhile(() {
      return Future.delayed(Duration(seconds: 1), () {
        if (!running) {
          return running;
        }

        count++;
        countStreamController.add(count);
        return running;
      });
    });
  }

  stop() {
    running = false;
  }
}
