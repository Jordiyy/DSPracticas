package baseNoStates.doorstates;

import baseNoStates.Clock;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
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
  public void close() { }

  @Override
  public void lock() {
    door.setState(new Locked(door));
    logger.info("Unlocked_Shortly to Lock door");
  }
  @Override
  public void unlock() { }

  @Override
  public void unlockShortly() { }

  public void update(Observable o, Object arg) {
    if (endDelay(LocalDateTime.now()) >= 10) {
      logger.info("HAN PASADO MAS DE 10 SEGUNDOS!!");
    }
    logger.info("Unlocked_shortly ha sido notificado");
  }

  private double endDelay(LocalDateTime timeToCompare) {
    double timeDifference = 0.0;

    timeDifference = unlockedShortlyStartTime.until(timeToCompare, ChronoUnit.MILLIS);

    return timeDifference;
  }
}
