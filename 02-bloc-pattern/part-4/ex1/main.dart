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
  // determine which events are valid for a given state
  var evtLookup = Map<State, List<Event>>();

  CounterBloc() {
    state = State();
  }

  int getState() {
    return state.counter;
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

    return;
  }
}

void main() {
  var sm = CounterBloc();

  sm.On(Event.INC);
  print(sm.getState());

  sm.On(Event.INC);
  print(sm.getState());

  sm.On(Event.DEC);
  print(sm.getState());
  sm.On(Event.INC);
  print(sm.getState());

  sm.On(Event.RESET);
  print(sm.getState());
}
