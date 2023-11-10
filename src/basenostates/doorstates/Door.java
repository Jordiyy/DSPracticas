package basenostates.doorstates;

import basenostates.areas.Area;
import basenostates.requests.RequestReader;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Definition of the Door class.
 * Defines the parameters of the door and the state it is in.
 */
public class Door {
  private final String id;      //Door id
  private final Area hasAccessToArea;        //Door destination area
  private final Area hasAccessFromArea;      //Door origin area
  private DoorState doorState;  //Door state
  static Logger logger = LoggerFactory.getLogger(Door.class);

  public Door(String id, Area to, Area from) {
    this.id = id;
    this.hasAccessToArea = to;
    this.hasAccessFromArea = from;

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
      logger.info("Not authorized");
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
        doorState.open();
        break;
      case Actions.CLOSE:
        doorState.close();
        break;
      case Actions.LOCK:
        doorState.lock();
        break;
      case Actions.UNLOCK:
        doorState.unlock();
        break;
      case Actions.UNLOCK_SHORTLY:
        doorState.unlockShortly();
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
    logger.debug("JSON object created.");
    return json;
  }

  public void setNewDoorState(DoorState doorState) {
    this.doorState = doorState;
  }

  public Area getHasAccessToArea() {
    return hasAccessToArea;
  }

  public Area getHasAccessFromArea() {
    return hasAccessFromArea;
  }
}