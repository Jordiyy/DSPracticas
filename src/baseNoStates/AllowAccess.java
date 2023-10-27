package baseNoStates;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * Class that checks access by date and time.
 */
public class AllowAccess {
  private LocalDate startPeriod;
  private LocalDate endPeriod;
  private int startingDayWeek;
  private int endDayWeek;
  private LocalTime startHour;
  private LocalTime endHour;

  public AllowAccess() {
    startPeriod = null;
    startingDayWeek = 0;
    startHour = null;

    endPeriod = null;
    endDayWeek = 0;
    endHour = null;
  }

  public void setStartPeriod(LocalDate startPeriod) {
    this.startPeriod = startPeriod;
  }

  public void setEndPeriod(LocalDate endPeriod) {
    this.endPeriod = endPeriod;
  }

  public void setStartingDayWeek(int startingDayWeek) {
    this.startingDayWeek = startingDayWeek;
  }

  public void setEndDayWeek(int endDayWeek) {
    this.endDayWeek = endDayWeek;
  }

  public void setStartHour(LocalTime startHour) {
    this.startHour = startHour;
  }

  public void setEndHour(LocalTime endHour) {
    this.endHour = endHour;
  }

  /**
   * Method that checks that the time is within the allowed range.
   * @param time is the time to check.
   * @return a condition fulfillment check boolean.
   */
  public boolean checkTime(LocalTime time) {
    try {
      return time.isAfter(startHour) && time.isBefore(endHour);
    } catch (NullPointerException e) {
      return false;
    }
  }

  /**
   * Method that checks that the date is within the allowed range.
   * @param date is the date to check.
   * @return a condition fulfillment check boolean.
   */
  public boolean checkPeriod(LocalDate date) {
    try {
      return date.isAfter(startPeriod) && date.isBefore(endPeriod);
    } catch (NullPointerException e) {
      return false;
    }
  }

  /**
   * Method that checks that the day is within the allowed range
   * @param day is the day to check
   * @return a condition fulfillment check boolean
   */
  public boolean checkDayWeek(int day) {
    try {
      return day >= startingDayWeek && day <= endDayWeek;
    } catch (NullPointerException e) {
      return false;
    }
  }

}
