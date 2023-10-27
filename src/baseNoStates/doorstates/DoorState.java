package baseNoStates.doorstates;

import java.util.Observable;
import java.util.Observer;

/**
 * We use State Design Pattern because it allows you to create new states of the door without
 * affecting much the code of the rest of the states.
 * Abstract class that defines the different states in which a door is: Locked, Unlocked,
 * Unlocked_Shortly and Propped (name of the classes).
 * Defines whether the door is open or closed
 */
public abstract class DoorState implements Observer {
  protected Door door;
  protected String name;
  protected boolean isClosed; //Door is closed if value is true, Door is opened is value is false.

  public DoorState(Door door) {
    this.door = door;
    isClosed = true;
  }

  public String getName() {
    return name;
  }

  public boolean getIsClose() {
    return isClosed;
  }

  /**
   * Methods with inheritance to open or close the door.
   */
  protected void open() {
    isClosed = false;
  }

  protected void close() {
    isClosed = true;
  }

  /**
   * Abstract methods that implement the different states that a door can have (State pattern).
   */
  public abstract void lock();

  public abstract void unlock();

  public abstract void unlockShortly();

  public abstract void propped();

  /**
   * Method that is called every time the observable notifies the objects to observe.
   * @param o     the observable object.
   * @param arg   an argument passed to the {@code notifyObservers}
   *                 method.
   */
  public void update(Observable o, Object arg) {  }
}
