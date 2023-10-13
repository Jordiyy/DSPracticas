package baseNoStates.doorstates;

import baseNoStates.areas.Space;
import baseNoStates.requests.RequestReader;
import org.json.JSONObject;

import java.util.Objects;


public class Door{
  private final String id;
  private Space to;
  private Space from;
  private boolean closed; // physically
  private DoorState doorState;

  public Door(String id, Space to, Space from) {
    this.id = id;
    this.to = to;
    this.from = from;

    doorState = new Unlocked(this);
  }

  public void processRequest(RequestReader request) {
    // it is the Door that process the request because the door has and knows
    // its state, and if closed or open
    if (request.isAuthorized()) {
      String action = request.getAction();
      doAction(action);
    } else {
      System.out.println("not authorized");
    }
    request.setDoorStateName(getStateName());
  }

  private void doAction(String action) {
    switch (action) {
      case Actions.OPEN:
        if (doorState.getIsClose() && Objects.equals(doorState.getName(), State.UNLOCKED)) {
          doorState.open();
        } else {
          System.out.println("Can't open door " + id + " because it's already open");
        }
        break;
      case Actions.CLOSE:
        if (doorState.getIsClose()) {
          System.out.println("Can't close door " + id + " because it's already closed");
        } else {
          doorState.close();
        }
        break;
      case Actions.LOCK:
        if(!Objects.equals(doorState.getName(), State.LOCKED)) { doorState.lock(); }
        break;
      case Actions.UNLOCK:
        if(!Objects.equals(doorState.getName(), State.UNLOCKED)) { doorState.unlock(); }
        break;
      case Actions.UNLOCK_SHORTLY:
        // TODO
        System.out.println("Action " + action + " not implemented yet");
        break;
      default:
        assert false : "Unknown action " + action;
        System.exit(-1);
    }
  }

  public boolean isClosed() {
    return doorState.getIsClose();
  }

  public String getId() {
    return id;
  }

  public String getStateName() {
    return doorState.getName();
  }

  @Override
  public String toString() {
    return "Door{"
        + ", id='" + id + '\''
        + ", closed=" + doorState.getIsClose()
        + ", state=" + getStateName()
        + "}";
  }

  public JSONObject toJson() {
    JSONObject json = new JSONObject();
    json.put("id", id);
    json.put("state", getStateName());
    json.put("closed", doorState.getIsClose());
    return json;
  }

  public void setState(DoorState doorState) { this.doorState = doorState; }

  public Space getTo() {
    return to;
  }

  public Space getFrom() {
    return from;
  }
}