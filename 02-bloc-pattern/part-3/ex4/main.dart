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

  void On(Event event) {
    if (!evtLookup[state].contains(event)) {
      print('$event - Not a valid event for state "$state"');
      return;
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
      case Event.PAUSE:
        state = State.PAUSING;
        print('pausing');
        for (var i = 0; i < 1 * 4e6; i++) {}
        print('transitioning to paused');
        state = State.PAUSED;
        break;
      default:
        print('TODO: Unhandled event $event');
        return;
    }

    print('State{from=$old to=$state}');
    return;
  }
}

void main() {
  var sm = StateMachine();

  sm.On(Event.START);
  print(sm.getState());

  sm.On(Event.GO);
  print(sm.getState());

  sm.On(Event.START);
  print(sm.getState());
}
