package baseNoStates;

import baseNoStates.doorstates.Door;
import java.time.LocalDateTime;
import java.util.*;

public class Clock extends Observable {
  private LocalDateTime date;
  private Timer timer;
  private int period;
  private ArrayList<Door> listDoorsToNotify = new ArrayList<>();
  //me gusta mas este nombre porque indica mejor para que sirve la varible
  //private List<Door> unlockedShortlyDoors = new ArrayList<>();
  private static Clock ck = null;

  public Clock() {
    this.period = 10;
    timer = new Timer();
  }

  public void start() {
    TimerTask repeatedTask = new TimerTask() {
      public void run() {
        date = LocalDateTime.now();
        System.out.println("run() executed at " + date);
        setChanged();
        notifyObservers();
        //if(!unlockedShortlyDoors.isEmpty()){ stop(); }
      }
    };

    timer.scheduleAtFixedRate(repeatedTask, 0, 1000 * period);
  }

  public void stop() {
    timer.cancel();
  }

  public int getPeriod() {
    return getPeriod();
  }

  public LocalDateTime getDate() {
    return date;
  }

//--------------------------------------------------------------------
  public static Clock getInstance() {
    if (ck == null) {
      ck = new Clock();
    }
    return ck;
  }



  //public void addDoor(Door door) { unlockedShortlyDoors.add(door); }
}
