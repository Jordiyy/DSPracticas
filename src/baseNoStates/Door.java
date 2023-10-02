package baseNoStates;

import baseNoStates.requests.RequestReader;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Clase que maneja todas las opciones de las puertas de la aplicación.
 */
public class Door {
  private final String id;
  private boolean closed; // physically
  private String state;

  static Logger logger = LoggerFactory.getLogger(Locked.class);

  /**
   * Constructor de la clase Door.
   * @param id
   */
  public Door(String id) {
    this.id = id;
    closed = true;
    state = getClass().getSimpleName().equalsIgnoreCase("locked") ? getClass().getSimpleName().toLowerCase() : "unlocked";
  }

  /**
   * Función que determina si una acción puede ser lleva a cabo partien de los permisos que tiene el usuario.
   * @param request
   */
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

  /**
   * Función que realiza los cambios de las puertas.
   * Abrir, cerrar, bloqueado, desbloqueado.
   * @param action
   */
  private void doAction(String action) {
    switch (action) {
      case Actions.OPEN:
        if (closed && state == "unlocked") {
          Unlocked door = new Unlocked(this);
          door.open();
          //closed = false;
        } else if (closed && state == "locked") {
          System.out.println("Unlock door " + id + " first. Then try to open it again.");
        } else {
          System.out.println("Can't open door " + id + " because it's already open");
        }
        break;
      case Actions.CLOSE:
        if (closed) {
          System.out.println("Can't close door " + id + " because it's already closed");
        } else {
          Locked door = new Locked(this);
          door.close();
          //closed = true;
        }
        break;
      case Actions.LOCK:
        if (state.equalsIgnoreCase("unlocked")) {
          setState(new Locked(this));
        }
        break;
      case Actions.UNLOCK:
        if (state.equalsIgnoreCase("locked")) {
          setState(new Unlocked(this));
        }
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

  public void setClosed(boolean state) {
    closed = state;
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

  /**
   * Conversión de datos para guardar los datos de la puerta en un archivo de tipo JSON.
   * @return
   */
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
