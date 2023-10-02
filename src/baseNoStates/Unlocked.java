package baseNoStates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Subclase que define los métodos de una puerta bloqueada.
 */
public class Unlocked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Unlocked.class);
  public Unlocked(Door door) {
    super(door);
  }

  @Override
  public void open() { }

  @Override
  public void close() { }

  @Override
  public void lock() {
    door.setState(new Locked(door));
    logger.info("Unlocked to Locked");
  }

  @Override
  public void unlock() { }
}
