package baseNoStates.doorstates;

import java.util.Objects;
import java.util.Observable;
import java.util.Observer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


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
  static Logger logger = LoggerFactory.getLogger(DoorState.class);

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
    if (isClosed && (Objects.equals(name, State.UNLOCKED)
        || Objects.equals(name, State.UNLOCKEDSHORTLY))) {
      isClosed = false;
      logger.debug("Door with id " + door.getId() + " is open.");
      logger.info("Door opened.");
    } else {
      logger.warn("Can't open door " + door.getId() + " because it's already open.");
    }
  }

  protected void close() {
    if (!isClosed) {
      isClosed = true;
      if (Objects.equals(door.getStateName(), State.PROPPED)) {
        door.setState(new Locked(door));
        logger.debug("Door with id " + door.getId() + " is closed.");
        logger.info("Door closed.");
      }
    } else {
      logger.warn("Can't close door " + door.getId() + " because it's already closed.");
    }
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
