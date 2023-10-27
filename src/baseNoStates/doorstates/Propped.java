package baseNoStates.doorstates;

import java.util.Observable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Door Propped status.
 * Defines abstract methods to states that can change.
 */
public class Propped extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Propped.class);

  public Propped(Door door) {
    super(door);
    isClosed = false;
    name = State.PROPPED;
  }

  @Override
  public void lock() {
    door.setState(new Locked(door));
    logger.info("Unlocked_Shortly to Lock door");
  }

  @Override
  public void unlock() {
    logger.info("NOT IMPLEMENTED");
  }

  @Override
  public void unlockShortly() {
    logger.info("NOT IMPLEMENTED");
  }

  @Override
  public void propped() {
    logger.info("NOT IMPLEMENTED");
  }
}
