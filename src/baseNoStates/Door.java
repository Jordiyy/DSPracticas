package baseNoStates;

import baseNoStates.requests.RequestReader;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.concurrent.TimeUnit;


public class Door {
  private final String id;
  private boolean closed; // physically
  private String state;

  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Door(String id) {
    this.id = id;
    closed = true;
    state = getClass().getSimpleName().equalsIgnoreCase(State.LOCKED) ? getClass().getSimpleName().toLowerCase() : State.UNLOCKED;
  }

  public void processRequest(RequestReader request) {
    // it is the Door that process the request because the door has and knows
    // its state, and if closed or open
    if (request.isAuthorized()) {
      String action = request.getAction();
      doAction(action);
    } else {
      logger.info("not authorized");
    }
    request.setDoorStateName(getStateName());
  }

  private void doAction(String action) {
    switch (action) {

      case Actions.OPEN:
        if (closed && state.equalsIgnoreCase(State.UNLOCKED)) {
          closed = false;
        } else {
          logger.info("Can't open door " + id + " because it's already open");
        }
        break;
      case Actions.CLOSE:
        if (closed) {
          logger.info("Can't close door " + id + " because it's already closed");
        } else {
          closed = true;
        }
        break;
      case Actions.LOCK:
        if (state.equalsIgnoreCase(State.UNLOCKED)) {
          Locked door = new Locked(this);
          door.lock();
        }
        break;
      case Actions.UNLOCK:
        if (state.equalsIgnoreCase(State.LOCKED)) {
          Unlocked door = new Unlocked(this);
          door.unlock();
        }
        break;
      case Actions.UNLOCK_SHORTLY:
        logger.info("Action " + action + " not implemented yet");

        Unlocked_Shortly door = new Unlocked_Shortly(this);
        door.unlockShortly();

        long startTime = System.currentTimeMillis();
        long finishTime = startTime + 10000;
        while(finishTime - startTime != 0){
          startTime = System.currentTimeMillis();
        }

        /*Locked door2 = new Locked(this);
        door2.lock();*/

        break;
      default:
        assert false : "Unknown action " + action;
        System.exit(-1);
    }
  }

  public boolean isClosed() {
    return closed;
  }

  public String getId() {
    return id;
  }

  public String getStateName() {
    return state;
  }

  @Override
  public String toString() {
    return "Door{"
        + ", id='" + id + '\''
        + ", closed=" + closed
        + ", state=" + getStateName()
        + "}";
  }

  public JSONObject toJson() {
    JSONObject json = new JSONObject();
    json.put("id", id);
    json.put("state", getStateName());
    json.put("closed", closed);
    return json;
  }

  public void setState(DoorState doorState) {
    state = doorState.getClass().getSimpleName().toLowerCase();
  }
}
