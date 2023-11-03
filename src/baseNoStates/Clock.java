package baseNoStates;

import java.time.LocalDateTime;
import java.util.Observable;
import java.util.Timer;
import java.util.TimerTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Background clock control class following Singleton Pattern because we only need one instance
 * of the object Clock that will be shared with the rest of Doors.
 */
public class Clock extends Observable {
  private LocalDateTime date;
  private final Timer timer;
  private static Clock ck;
  static Logger logger = LoggerFactory.getLogger(Clock.class);

  public Clock() {
    ck = null;
    timer = new Timer();
  }

  /**
   * Method that starts the clock
   */
  public void start() {
    TimerTask repeatedTask = new TimerTask() {
      public void run() {
        date = LocalDateTime.now();
        logger.debug("run() executed at " + date);
        setChanged();
        notifyObservers();
      }
    };

    timer.scheduleAtFixedRate(repeatedTask, 0, 1000);
  }

  /**
   * Recovers an instance of the Clock.
   * @return The Clock instance.
   */
  public static Clock getInstance() {
    if (ck == null) {
      ck = new Clock();
      logger.debug("New Clock instance created.");
    } else {
      logger.debug("Clock instance already created. Return created Clock instance");
    }

    return ck;
  }

}
