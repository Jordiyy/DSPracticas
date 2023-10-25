package baseNoStates.doorstates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Observable;

public class Unlocked_Shortly extends DoorState{
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Unlocked_Shortly(Door door) {
    super(door);
    name = State.UNLOCKEDSHORTLY;
    final int period = 2;
  }
  @Override
  public void open() { isClosed =false; }

  @Override
  public void close() { }

  @Override
  public void lock() {
    door.setState(new Locked(door));
    logger.info("Unlocked_Shortly to Lock door");
  }
  @Override
  public void unlock() { logger.info("NOT IMPLEMENTED"); }

  @Override
  public void unlockShortly() { logger.info("NOT IMPLEMENTED"); }

  @Override
  public void update(Observable o, Object arg) {
    logger.info("Unlocked_shortly ha sido notificado");
  }
}
