package baseNoStates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Locked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);
  public Locked(Door door) {
    super(door);
  }

  public void open() {
    logger.info("Try to open a door...");
    //Do something
    logger.info("Cannot open a locked door.");
  }

  public void close() {
    logger.info("Cannot close a closed locked door.");
  }

  public void lock() {
    logger.info("NOT IMPLEMENTED");
  }

  public void unlocked() {
    logger.info("NOT IMPLEMENTED");
  }
}
