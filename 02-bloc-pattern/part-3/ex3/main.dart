enum Event {
  START,
  GO,
  PAUSE,
  STOP,
  END,
}

enum State {
  INIT, // accepts START->STARTED
  STARTED, // accepts GO->RUNNING, STOP->STOPPED
  RUNNING, // accepts PAUSE->PAUSING
  PAUSING, // ->PAUSED, ->END
  PAUSED, // accepts GO->RUNNING, STOP->STOPPED
  STOPPED, // accepts START->STARTED, END->END
  END,
}

class StateMachine {
  State state;
  // determine which events are valid for a given state
  var evtLookup = Map<State, List<Event>>();

  StateMachine() {
    this.state = State.INIT;
    evtLookup[State.INIT] = [Event.START];
    evtLookup[State.STARTED] = [Event.GO, Event.STOP];
    evtLookup[State.RUNNING] = [Event.PAUSE];
    evtLookup[State.PAUSING] = [];
    evtLookup[State.PAUSED] = [Event.END, Event.STOP];
    evtLookup[State.STOPPED] = [Event.START, Event.END];
  }

  State getState() {
    return state;
  }

  StateMachine On(Event event) {
    if (!evtLookup[state].contains(event)) {
      print('$event - Not a valid event for state "$state"');
      return this;
    }

    var old = state;
    switch (event) {
      case Event.START:
        print('starting');
        state = State.STARTED;
        break;
      case Event.GO:
        print('about to run');
        state = State.RUNNING;
        break;
      default:
        print('TODO: Unhandled event $event');
        return this;
    }

    print('State{from=$old to=$state}');
    return this;
  }
}

void main() {
  var sm = StateMachine();

  print(sm.On(Event.START).On(Event.GO).On(Event.START).getState());

  sm..On(Event.START)..On(Event.GO)..On(Event.START);

  print(sm.getState());
}
