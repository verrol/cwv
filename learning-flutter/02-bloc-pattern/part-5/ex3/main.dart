import 'dart:async';

class TimerBloc {
  StreamController<DateTime> _streamController;
  bool _isEnabled = false;

  TimerBloc() {
    _streamController =
        StreamController.broadcast(onListen: _onListen, onCancel: _onCancel);
  }

  _onListen() {
    print('enabling stream');
    _isEnabled = true;
    start();
  }

  _onCancel() {
    print('disabling stream');
    _isEnabled = false;
  }

  Stream<DateTime> getStream() {
    return _streamController.stream;
  }

  start() {
    Future.doWhile(() {
      return Future.delayed(Duration(seconds: 1), () {
        _on();
        return _isEnabled;
      });
    });
  }

  void _on() {
    print('adding event to state');

    if (_isEnabled) {
      print('emit events');
      _streamController.add(DateTime.now());
    }
  }
}

void main() {
  var sm = TimerBloc();

  var sub0 = sm.getStream().listen((onData) {
    print("Listener 1: $onData");
  });

  var sub1 = sm.getStream().listen((onData) {
    print('Listener 2: $onData');
  });

  Future.delayed(Duration(seconds: 3), (){
    sub0.cancel();
  });

  Future.delayed(Duration(seconds: 7), (){
    sub1.cancel();
  });

  print('main() ending');
}
