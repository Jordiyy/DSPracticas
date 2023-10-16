package baseNoStates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Locked extends DoorState {
  static Logger logger = LoggerFactory.getLogger(Locked.class);

  public Locked(Door door) {
    super(door);
    //Equivalente a name="locked"
    // ¿Por qué lo hacemos a través de clase State? Por ej: Si tienes múltiples partes de tu código que hacen referencia al estado "locked" y, en el futuro, necesitas
    // cambiar ese estado a "cerrado con llave", simplemente tendrías que cambiar el valor en una sola ubicación en la clase State en lugar de buscar y cambiar cada
    // instancia de "locked" en todo el código.
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
