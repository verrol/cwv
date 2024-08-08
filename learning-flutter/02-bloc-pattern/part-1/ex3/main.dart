// https://api.dartlang.org/stable/2.2.0/dart-async/Stream-class.html

main() {
  handleEvents('Hello World!');
  Stream<int> src;
  src.listen(handleEvents);
}

handleEvents(evt) {
  print('Got an event: $evt');
}
