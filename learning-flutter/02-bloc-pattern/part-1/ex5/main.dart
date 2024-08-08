// https://api.dartlang.org/stable/2.2.0/dart-async/Stream-class.html

main() {
  var period = Duration(seconds: 2);
  Stream<int> src = Stream.periodic(period);
  src.listen(handleEvents);
}

handleEvents(evt) {
  print('Got an event: $evt');
}
