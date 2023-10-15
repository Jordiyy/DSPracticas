package baseNoStates.doorstates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Clase para definir que el estado de la puerta seleccionada esta bloqueada.
 */
public class Locked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  //Constructor de la clase
  public Locked(Door door) {
    super(door);
    name = State.LOCKED;
  }

  @Override
  public void lock() { logger.info("NOT IMPLEMENTED"); }

  //Cambia la clase del objeto Door de Locked a Unlocked.
  @Override
  public void unlock(){
    door.setState(new Unlocked(door));
    logger.info("Locked to Unlocked door");
  }

  @Override
  public void unlockShortly(){ logger.info("NOT IMPLEMENTED"); }
}
