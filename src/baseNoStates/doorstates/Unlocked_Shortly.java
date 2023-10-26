package baseNoStates.doorstates;

import java.util.Observable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Observable;
import java.util.Observer;

public class Unlocked_Shortly extends DoorState {
  Clock ck;
  static Logger logger = LoggerFactory.getLogger(Locked.class);
  LocalDateTime unlockedShortlyStartTime;

  public Unlocked_Shortly(Door door) {
    super(door);
    name = State.UNLOCKEDSHORTLY;
    unlockedShortlyStartTime = LocalDateTime.now();
    ck = Clock.getInstance();
    ck.addObserver((Observer) this);
    ck.start();
  }

  @Override
  public void open() {
    isClosed = false;
  }

  @Override
  public void open() { isClosed =false; }

  @Override
  public void lock() {
    door.setState(new Locked(door));
    logger.info("Unlocked_Shortly to Lock door");
  }
  @Override
  public void unlock() { logger.info("NOT IMPLEMENTED"); }

  @Override
  public void unlockShortly() { }

  public void update(Observable o, Object arg) {
    if (endDelay(LocalDateTime.now()) >= 10000) {
      logger.info("HAN PASADO MAS DE 10 SEGUNDOS!!");
      if (door.isClosed()) {
        door.setState(new Locked(door));
      } else {
        //door.setState(new Unlocked(door));
        //falta crear el estado propped
        door.setState(new Propped(door));
      }
      ck.deleteObserver(this);
      if (ck.countObservers() == 0) {
        ck.stop();
      }
    }
    logger.info("Unlocked_shortly ha sido notificado");
  }

  private double endDelay(LocalDateTime timeToCompare) {
    return unlockedShortlyStartTime.until(timeToCompare, ChronoUnit.MILLIS);
  }
}
