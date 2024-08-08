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

  StateMachine() {
    this.state = State.INIT;
  }

  State getState() {
    return state;
  }
}

void main() {
  var sm = StateMachine();

  print(sm.getState());
}
