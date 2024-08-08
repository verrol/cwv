import 'dart:async';

void main() {
  task1().then((onValue) {
    print("I $onValue - note 1");
  });

  task2().then((onValue) {
    print("I $onValue");
  });

  Future.microtask(() {
    print('doing this quick thing on the microtask queue');
  });

  reward();
  print('this is the end of main()');
}

Future<String> task1() {
  var f = Future(() {
    (DateTime.now());
    print('doing task1');
    for (var i = 0; i < 4 * 1e9; i++) {}
    return 'complete task 1';
  });

  return f;
}

Future<String> task2() {
  var f = Future(() {
    print(DateTime.now());
    print('doing task2');
    for (var i = 0; i < 4 * 1e9; i++) {}
    return 'completed task 2';
  });

  return f;
}

void reward() {
  print(DateTime.now());
  print('enjoying reward');
}
