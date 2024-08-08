import 'dart:async';

void main() {
  Future(task1)
    .then((onValue) {
      print("I $onValue - note 1");
      return Future(() {
        return 'still a bit more to do for $onValue';
      });
    })
    .then((onValue) {
      print("I $onValue - note 2");
    });

  Future(task2);

  Future.microtask(() {
    print('doing this quick thing on the microtask queue');
  });

  reward();
  print('this is the end of main()');
}

String task1() {
  print(DateTime.now());
  print('doing task1');
  for (var i = 0; i < 4 * 1e9; i++) {}
  return 'complete task 1';
}

String task2() {
  print(DateTime.now());
  print('doing task2');
  for (var i = 0; i < 4 * 1e9; i++) {}
  return 'completed task 2';
}

void reward() {
  print(DateTime.now());
  print('enjoying reward');
}
