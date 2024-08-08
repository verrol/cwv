import 'dart:async';

import 'dart:math';

var rn = Random(DateTime.now().millisecondsSinceEpoch);

void main() {
  var s = getNums(5);
  s.listen((onData) {
    print('got $onData from the stream');
  });
}

Stream<int> getNums(int total) async* {
  for (var i = 0; i < total; i++) {
    yield i;
  }
}
