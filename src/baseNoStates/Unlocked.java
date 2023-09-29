package baseNoStates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Subclase que define los métodos de una puerta bloqueada.
 */
public class Unlocked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Unlocked(Door door) {
    super(door);
  }

  public void open() {
    logger.info("Try to open the door" + this.name + " ...");
    //Do something
    logger.info("Door" + this.name + " opened.");
  }

  public void close() {
    logger.info("Closing the door " + this.name + ".");
  }

  public void lock() {
    logger.info("NOT IMPLEMENTED");
  }

  public void unlocked() {
    logger.info("NOT IMPLEMENTED");
  }
}
