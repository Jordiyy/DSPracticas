package basenostates;

import java.time.LocalDate;
import java.time.LocalTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Class that checks access by date and time.
 */
public class AllowAccess {
  private LocalDate startPeriod;
  private LocalDate endPeriod;
  private int startDayWeek;
  private int endDayWeek;
  private LocalTime startHour;
  private LocalTime endHour;
  static Logger logger = LoggerFactory.getLogger(AllowAccess.class);

  public AllowAccess() {
    startPeriod = null;
    startDayWeek = 0;
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

  public void setStartDayWeek(int startDayWeek) {
    this.startDayWeek = startDayWeek;
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
      logger.debug("Checking access time.");
      return time.isAfter(startHour) && time.isBefore(endHour);
    } catch (NullPointerException e) {
      logger.error("Variable missing. Set access time again or checked parameters are null.");
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
      logger.debug("Checking access period.");
      return date.isAfter(startPeriod) && date.isBefore(endPeriod);
    } catch (NullPointerException e) {
      logger.error("Variable missing. Set period time again or checked parameters are null.");
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
      logger.debug("Checking if day is accessible.");
      return day >= startDayWeek && day <= endDayWeek;
    } catch (NullPointerException e) {
      logger.error("Variable missing."
          + " Set days of week entry again or checked parameter is null.");
      return false;
    }
  }

}
