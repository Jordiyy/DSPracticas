package baseNoStates.doorstates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Locked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Locked(Door door) {
    super(door);
    name = State.LOCKED;
  }

  @Override
  public void lock() { logger.info("NOT IMPLEMENTED"); }
  @Override
  public void unlock(){
    door.setState(new Unlocked(door));
    logger.info("Locked to Unlocked door");
  }

  @Override
  public void unlockShortly(){ logger.info("NOT IMPLEMENTED"); }
}
