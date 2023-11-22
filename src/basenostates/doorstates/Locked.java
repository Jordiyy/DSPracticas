package basenostates.doorstates;

import java.util.Observable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Door locket status.
 * Defines abstract methods to states that can change.
 */
public class Locked extends DoorState {
  static Logger logger = LoggerFactory.getLogger("Fita1");

  public Locked(Door door) {
    super(door);
    name = State.LOCKED;
  }

  @Override
  public void lock() {
    logger.debug("State LOCKED: lock() not implemented.");
  }

  @Override
  public void unlock() {
    door.setNewDoorState(new Unlocked(door));
    logger.debug("Locked state to Unlocked state.");
    logger.info("Locked to Unlocked door.");
  }

  @Override
  public void unlockShortly() {
    door.setNewDoorState(new UnlockedShortly(door));
    logger.debug("Locked state to Unlocked Shortly state.");
    logger.info("Locked to Unlocked Shortly door.");
  }

  @Override
  public void propped() {
    logger.debug("State LOCKED: propped() not implemented.");
  }

  /**
   * Notify the door in locket status.
   * @param o     the observable object.
   * @param arg   an argument passed to the {@code notifyObservers}
   *                 method.
   */
  @Override
  public void update(Observable o, Object arg) {
    logger.debug("State LOCKED had been notified.");
  }
}
