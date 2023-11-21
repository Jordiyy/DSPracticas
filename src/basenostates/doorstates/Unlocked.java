package basenostates.doorstates;

import java.util.Observable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Door Unlocked status.
 * Defines abstract methods to states that can change.
 */
public class Unlocked extends DoorState {
  public Unlocked(Door door) {
    super(door);
    name = State.UNLOCKED;
  }

  @Override
  public void lock() {
    logger.debug("Unlocked to Locked door");
    door.setNewDoorState(new Locked(door));
    logger.info("Unlocked to Locked door");
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

  @Override
  public void update(Observable o, Object arg) {
    logger.info("Unlocked ha sido notificado");
  }
}
