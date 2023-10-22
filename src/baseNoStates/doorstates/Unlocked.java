package baseNoStates.doorstates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Subclase que define los métodos de una puerta bloqueada.
 */
public class Unlocked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Unlocked.class);
  public Unlocked(Door door) {
    super(door);
    name = State.UNLOCKED;
  }

  @Override
  public void lock() {
    door.setState(new Locked(door));
    logger.info("Unlocked to Locked door");
  }

  @Override
  public void unlock() { logger.info("NOT IMPLEMENTED"); }

  @Override
  public void unlockShortly() { logger.info("NOT IMPLEMENTED"); }
}
