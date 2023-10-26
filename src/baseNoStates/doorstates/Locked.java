package baseNoStates.doorstates;

import java.util.Observable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Door locket status.
 * Defines abstract methods to states that can change.
 */
public class Locked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Locked(Door door) {
    super(door);
    name = State.LOCKED;
  }

  @Override
  public void lock() {
    logger.info("NOT IMPLEMENTED");
  }

  @Override
  public void unlock() {
    door.setState(new Unlocked(door));
    logger.info("Locked to Unlocked door");
  }

  @Override
  public void unlockShortly(){
    door.setState(new Unlocked_Shortly(door));
    logger.info("Locked to Unlocked_Shortly");
  }

  @Override
  public void propped() {
    logger.info("NOT IMPLEMENTED");
  }

  /**
   * Notify the door in locket status.
   * @param o     the observable object.
   * @param arg   an argument passed to the {@code notifyObservers}
   *                 method.
   */
  @Override
  public void update(Observable o, Object arg) {
    logger.info("Locked ha sido notificado");
  }
}
