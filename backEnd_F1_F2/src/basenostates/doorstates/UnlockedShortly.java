package basenostates.doorstates;

import basenostates.Clock;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Observable;
import java.util.Observer;

import basenostates.doorstates.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Door Unlocked_Shortly status.
 * Defines abstract methods to states that can change.
 */
public class UnlockedShortly extends DoorState {
  private final Clock ck;
  private final LocalDateTime unlockedShortlyStartTime;
  static Logger logger = LoggerFactory.getLogger("Fita1");

  public UnlockedShortly(Door door) {
    super(door);
    name = State.UNLOCKEDSHORTLY;
    unlockedShortlyStartTime = LocalDateTime.now();
    ck = Clock.getInstance();
    ck.addObserver((Observer) this);
    ck.start();
  }

  @Override
  public void lock() {
    door.setNewDoorState(new Locked(door));
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
    door.setNewDoorState(new Propped(door));
  }

  public void update(Observable o, Object arg) {
    if (endDelay(LocalDateTime.now()) >= 10000) {
      logger.info("IT'S BEEN MORE THAN 10 SECONDS!!");
      if (door.isClosed()) {
        lock();
      } else {
        propped();
      }
      ck.deleteObserver(this);
    }
    logger.info("Unlocked_shortly has been notified");
  }

  private double endDelay(LocalDateTime timeToCompare) {
    return unlockedShortlyStartTime.until(timeToCompare, ChronoUnit.MILLIS);
  }
}
