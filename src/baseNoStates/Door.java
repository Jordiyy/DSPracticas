package baseNoStates;

import baseNoStates.requests.RequestReader;
import org.json.JSONObject;

import java.util.Objects;


public class Door{
  private final String id;
  private Space to;
  private Space from;
  private boolean closed; // physically
  private DoorState doorState;

  //Constructor del objeto de tipo Door.
  public Door(String id, Space to, Space from) {
    this.id = id;
    this.to = to;
    this.from = from;

    //Toda puerta parte del estado UNLOCKED
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

  //Switch case para las acciones a realizar sobre la puerta seleccionada.
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

  //Devuelve el tipo de puerta al que pertenece.
  public String getStateName() {
    return doorState.getName();
  }

  //Devuelve la información de la puerta en un String.
  @Override
  public String toString() {
    return "Door{"
        + ", id='" + id + '\''
        + ", closed=" + doorState.getIsClose()
        + ", state=" + getStateName()
        + "}";
  }

  //Devuelve la información de la puerta en un documento JSON.
  public JSONObject toJson() {
    JSONObject json = new JSONObject();
    json.put("id", id);
    json.put("state", getStateName());
    json.put("closed", doorState.getIsClose());
    return json;
  }

  //Cambia el tipo de clase de la varaible de tipo abstracta DooState.
  public void setState(DoorState doorState) {
    this.doorState = doorState;
  }

  //Devuelve el espacia correspondiente al otro lado del que abre la puerta.
  public Space getTo() {
    return to;
  }

  //Devuelve el espacio al que pertenece hacia el lado que abre la puerta.
  public Space getFrom() {
    return from;
  }
}