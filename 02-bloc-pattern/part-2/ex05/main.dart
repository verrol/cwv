import 'dart:async';

import 'dart:math';

var rn = Random(DateTime.now().millisecondsSinceEpoch);

void main() async{
  var s = getNums(5);
  await for (var d in s) {
    print('got $d from the stream');
  }
}

Stream<int> getNums(int total) async* {
  for (var i = 0; i < total; i++) {
    yield i;
  }
}
