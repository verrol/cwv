import 'dart:async';

enum Event {
  INC,
  DEC,
  RESET,
}

class State {
  int counter;
  State() {
    counter = 0;
  }
}

class CounterBloc {
  State state;
  StreamController streamController;

  // determine which events are valid for a given state
  var evtLookup = Map<State, List<Event>>();

  CounterBloc() {
    state = State();
    streamController = StreamController<int>.broadcast();
  }

  Stream<int> getStream() {
    return streamController.stream;
  }

  void On(Event event) {
    switch (event) {
      case Event.INC:
        state.counter++;
        break;
      case Event.DEC:
        state.counter--;
        break;
      case Event.RESET:
        state = State();
        break;
      default:
    }

    streamController.add(state.counter);
  }
}

void main() {
  var sm = CounterBloc();

  sm.getStream().listen((onData) {
    print("Listener 1: ${onData}");
  });

  sm.getStream().listen((onData) {
    print("Listener 2: ${onData}");
  });

  sm.On(Event.INC);
  sm.On(Event.INC);
  sm.On(Event.DEC);
  sm.On(Event.INC);
  sm.On(Event.RESET);
}
