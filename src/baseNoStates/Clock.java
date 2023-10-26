package baseNoStates;

import java.time.LocalDateTime;
import java.util.*;

/**
 * Background clock control class following Singleton Pattern because we only need one instance
 * of the object Clock that will be shared with the rest of Doors.
 */
public class Clock extends Observable {
  private LocalDateTime date;
  private final Timer timer;
  private static Clock ck;

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
        System.out.println("run() executed at " + date);
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
    }
    return ck;
  }

}
