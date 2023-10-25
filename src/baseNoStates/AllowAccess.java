package baseNoStates;

import java.time.LocalDate;
import java.time.LocalTime;

public class AllowAccess {
  //private UserGroup userGroup;
  private LocalDate startPeriod;
  private LocalDate endPeriod;
  private int startingDayWeek;
  private int endDayWeek;
  private LocalTime startHour;
  private LocalTime endHour;

  public AllowAccess() {
    //void
    startPeriod = null;
    startingDayWeek = 0;
    startHour = null;

    endPeriod = null;
    endDayWeek = 0;
    endHour = null;
  }

  public LocalDate getStartPeriod() {
    return startPeriod;
  }

  public void setStartPeriod(LocalDate startPeriod) {
    this.startPeriod = startPeriod;
  }

  public LocalDate getEndPeriod() {
    return endPeriod;
  }

  public void setEndPeriod(LocalDate endPeriod) {
    this.endPeriod = endPeriod;
  }

  public int getStartingDayWeek() {
    return startingDayWeek;
  }

  public void setStartingDayWeek(int startingDayWeek) {
    this.startingDayWeek = startingDayWeek;
  }

  public int getEndDayWeek() {
    return endDayWeek;
  }

  public void setEndDayWeek(int endDayWeek) {
    this.endDayWeek = endDayWeek;
  }

  public LocalTime getStartHour() {
    return startHour;
  }

  public void setStartHour(LocalTime startHour) {
    this.startHour = startHour;
  }

  public LocalTime getEndHour() {
    return endHour;
  }

  public void setEndHour(LocalTime endHour) {
    this.endHour = endHour;
  }

  public boolean checkTime(LocalTime time) {
    return time.isAfter(startHour) && time.isBefore(endHour);
  }

  public boolean checkPeriod(LocalDate date) {
    return date.isAfter(startPeriod) && date.isBefore(endPeriod);
  }

  public boolean checkDayWeek(int day) {
    return day >= startingDayWeek && day <= endDayWeek;
  }

}
