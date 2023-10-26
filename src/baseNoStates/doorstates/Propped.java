package baseNoStates.doorstates;

import baseNoStates.Clock;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.time.LocalDateTime;
import java.util.Observable;

public class Propped extends DoorState {
  Clock ck;
  static Logger logger = LoggerFactory.getLogger(Propped.class);
  LocalDateTime unlockedShortlyStartTime;

  public Propped(Door door) {
    super(door);
    isClosed = false;
    name = State.PROPPED;
  }

  @Override
  public void open() {
    isClosed = false;
  }

  @Override
  public void close() {
    isClosed = true;
    lock();
  }

  @Override
  public void lock() {
    door.setState(new Locked(door));
    logger.info("Unlocked_Shortly to Lock door");
  }
  @Override
  public void unlock() { }

  @Override
  public void unlockShortly() { }

  public void update(Observable o, Object arg) {  }
}
