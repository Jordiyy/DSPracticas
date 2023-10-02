package baseNoStates;

/**
 * Clase abtracta para definir los posibles estados de la puerta.
 */
public abstract class DoorState {
  protected Door door;
  protected String name;

  public DoorState(Door door) {
    this.door = door;
    name = door.getId();
  }

  public abstract void open();

  public abstract void close();

  public abstract void lock();

  public abstract void unlock();
}
