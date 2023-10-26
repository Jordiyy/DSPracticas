package baseNoStates.doorstates;

import java.util.Observer;

/**
 * Clase abtracta para definir los posibles estados de la puerta.
 */
public abstract class DoorState implements Observer {
  protected Door door;
  protected String name;
  protected boolean isClosed;

  public DoorState(Door door) {
    this.door = door;
    isClosed = true;
  }

  public String getName() { return name; }

  public boolean getIsClose() { return isClosed; }

  protected abstract void open();

  protected void close() { isClosed=true; }

  public abstract void lock();

  public abstract void unlock();

  public abstract void unlockShortly();
}
