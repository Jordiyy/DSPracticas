package baseNoStates.doorstates;

/**
 * Clase abtracta para definir los posibles estados de la puerta, siguiendo el patrón State.
 * door -->  instancia de un objeto de tipo Door
 * name --> identificador de la puerta
 * isClosed --> indica el estado de la puerta, si esta abierto o cerrado
 */
public abstract class DoorState {
  protected Door door;
  protected String name;
  private boolean isClosed;

  public DoorState(Door door) {
    this.door = door;
    isClosed = true;
  }
  public String getName() { return name; }
  public boolean getIsClose() { return isClosed; }

  protected void open() { isClosed=false; }

  protected void close() { isClosed=true; }

  public abstract void lock();

  public abstract void unlock();

  public abstract void unlockShortly();
}
