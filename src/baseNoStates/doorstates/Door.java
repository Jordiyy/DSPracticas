package baseNoStates.doorstates;

import baseNoStates.areas.Area;
import baseNoStates.requests.RequestReader;
import java.util.Objects;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Definition of the Door class.
 * Defines the parameters of the door and the state it is in.
 */
public class Door {
  private final String id;      //Door id
  private final Area to;        //Door destination area
  private final Area from;      //Door origin area
  private DoorState doorState;  //Door state
  static Logger logger = LoggerFactory.getLogger(Door.class);

  public Door(String id, Area to, Area from) {
    this.id = id;
    this.to = to;
    this.from = from;

    doorState = new Unlocked(this);
  }

  /**
   * Method that processes the request to perform the action.
   * The door knows its status and whether it is open or closed.
   * @param request is the request to process.
   */
  public void processRequest(RequestReader request) {
    if (request.isAuthorized()) {
      String action = request.getAction();
      doAction(action);
    } else {
      System.out.println("not authorized");
    }
    request.setDoorStateName(getStateName());
  }

  /**
   * Method that executes the action of the requet.
   * Switch between door states (State pattern).
   * @param action is the action to be performed (state changes and open/close the door).
   */
  private void doAction(String action) {
    switch (action) {
      case Actions.OPEN:
        if (doorState.getIsClose() && (Objects.equals(doorState.getName(), State.UNLOCKED) || Objects.equals(doorState.getName(), State.UNLOCKEDSHORTLY))) {
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
        if(!Objects.equals(doorState.getName(), State.LOCKED)) {
          doorState.lock();
        }
        break;
      case Actions.UNLOCK:
        if(!Objects.equals(doorState.getName(), State.UNLOCKED)) {
          doorState.unlock();
        }
        break;
      case Actions.UNLOCK_SHORTLY:
        if(!Objects.equals(doorState.getName(), State.UNLOCKEDSHORTLY)) {
          doorState.unlockShortly();
        }
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

  /**
   * Getter method a string representation of this Door object.
   * @return a string representing the Door instance.
   */
  @Override
  public String toString() {
    return "Door{"
        + ", id='" + id + '\''
        + ", closed=" + doorState.getIsClose()
        + ", state=" + getStateName()
        + "}";
  }

  /**
   * Method that converts an instance of the Door class to a JSON object.
   * @return A JSON object with information about a Door instance.
   */
  public JSONObject toJson() {
    JSONObject json = new JSONObject();
    json.put("id", id);
    json.put("state", getStateName());
    json.put("closed", doorState.getIsClose());
    return json;
  }

  public void setState(DoorState doorState) {
    this.doorState = doorState;
  }

  public Area getTo() {
    return to;
  }

  public Area getFrom() {
    return from;
  }
}