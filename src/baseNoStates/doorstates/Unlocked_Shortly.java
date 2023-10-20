package baseNoStates.doorstates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Unlocked_Shortly extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Unlocked_Shortly(Door door) {
    super(door);
  }

  @Override
  public void open() { }

  @Override
  public void close() { }

  @Override
  public void lock() { }

  @Override
  public void unlock() { }

  @Override
  public void unlockShortly() {
    door.setState(new Unlocked_Shortly(door));
    logger.info("Locked to UnlockedShortly");
  }
}
