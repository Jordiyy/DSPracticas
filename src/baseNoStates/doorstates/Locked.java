package baseNoStates.doorstates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Observable;

public class Locked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Locked(Door door) {
    super(door);
    name = State.LOCKED;
  }

  @Override
  protected void open() {
    isClosed=false;
  }

  @Override
  public void lock() { logger.info("NOT IMPLEMENTED"); }
  @Override
  public void unlock(){
    door.setState(new Unlocked(door));
    logger.info("Locked to Unlocked door");
  }

  @Override
  public void unlockShortly(){
    door.setState(new Unlocked_Shortly(door));
    logger.info("Locked to Unlocked_Shortly");
  }

  @Override
  public void update(Observable o, Object arg) {
    logger.info("Locked ha sido notificado");
  }
}
