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

  State getState() {
    return state;
  }

  void On(Event event) {
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
        return;
    }

    print('State{from=$old to=$state}');
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
