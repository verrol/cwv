// https://api.dartlang.org/stable/2.2.0/dart-async/Stream-class.html
import 'dart:async';

var list = [2, 3, 3.14, 'Hello world!', 9, 'more stuff here'];
StreamSubscription ss;

main() {
  var period = Duration(seconds: 2);
  Stream src = Stream.periodic(period, comput);

  src = Stream.fromIterable(list);
  ss = src.listen(handleEvents, onDone: () {
    print('I am done');
  }, onError: (err) {
    print('There was an error on this stream: $err');
  }, cancelOnError: true);
}

comput(int i) {
  if (i < list.length) {
    return list[i];
  }

  ss.cancel();
}

handleEvents(evt) {
  print('Got an event: $evt');
}
