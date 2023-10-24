package baseNoStates;

import baseNoStates.doorstates.Door;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class Clock{
  private LocalDateTime date;
  private Timer timer;
  private int period;

  private List<Door> unlockedShortlyDoors = new ArrayList<>();

  public Clock(int period) {
    this.period = period;
    timer = new Timer();
  }

  public void start(){
    TimerTask repeatedTask = new TimerTask(){
      public void run() {
        date = LocalDateTime.now();
        System.out.println("run() executed at " + date);
        //if(!unlockedShortlyDoors.isEmpty()){ stop(); }
      }
    };
    timer.scheduleAtFixedRate(repeatedTask, 0, 1000 * period);
  }

  public void stop() { timer.cancel(); }
  public int getPeriod() { return getPeriod(); }
  public LocalDateTime getDate() { return date; }

  public void addDoor(Door door) { unlockedShortlyDoors.add(door); }
}
