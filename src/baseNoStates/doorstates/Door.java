package baseNoStates.doorstates;
import baseNoStates.Clock;
import baseNoStates.areas.Area;
import baseNoStates.areas.Space;
import baseNoStates.requests.RequestReader;

import java.util.Objects;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Door {
  private final String id;
  private final Area to;
  private final Area from;
  private DoorState doorState;

  private Clock ck;

  static Logger logger = LoggerFactory.getLogger(Door.class);

  public Door(String id, Space to, Space from) {
    this.id = id;
    this.to = to;
    this.from = from;

    doorState = new Unlocked(this);

    ck = Clock.getInstance();
    ck.addObserver(doorState);
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
        if(!Objects.equals(doorState.getName(), State.LOCKED)) { doorState.lock(); }
        break;
      case Actions.UNLOCK:
        if(!Objects.equals(doorState.getName(), State.UNLOCKED)) { doorState.unlock(); }
        break;
      case Actions.UNLOCK_SHORTLY:
        if(!Objects.equals(doorState.getName(), State.UNLOCKEDSHORTLY)) {
          logger.info("Opcion unlocked");
          doorState.unlockShortly();
          ck.start();
          //clock.addDoor(doorState.door);
          //wait(11);
         // doorState.lock();

        }
        System.out.println("Action " + action + " not implemented yet");
        break;
      default:
        assert false : "Unknown action " + action;
        System.exit(-1);
    }
  }
  private static void wait(int seconds){
    try{
      Thread.sleep(1000*seconds);
    } catch (InterruptedException e){
      e.printStackTrace();
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

  public Area getTo() {
    return to;
  }

  public Area getFrom() {
    return from;
  }
}