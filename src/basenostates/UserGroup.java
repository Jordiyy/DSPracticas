package basenostates;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Class that defines a group of user with his permissions to enter an Area.
 */
public class UserGroup {
  private final String groupName; //Name of the UserGroup.
  private final List<User> userList;  //List of user that belongs to that UserGroup.
  private final AllowAccess hasAccess; //Object that controls if a User has permissions
  // to access with date and time.
  private final List<Area> areasPermissionForGroup;  //List of Areas that UserGroup has acces.
  static Logger logger = LoggerFactory.getLogger("Fita1");

  public UserGroup(String groupName, ArrayList<User> userList,
                   LocalDateTime startTime, LocalDateTime endTime) {
    this.groupName = groupName;
    this.userList = userList;
    this.hasAccess = new AllowAccess();

    setAllowAccess(startTime, endTime);

    areasPermissionForGroup = new ArrayList<>();
  }

  public List<User> getUserList() {
    return userList;
  }

  public void addUser(User user) {
    userList.add(user);
  }

  public void addAllUsers(List<User> arrayUsers) {
    userList.addAll(arrayUsers);
  }

  /**
   * Method that sets which areas a group of users is allowed
   * @param areas is the root area to explore, to add the areas allowed to the roles.
   * @param notPermissionArea is a list of strings with the names of the disallowed areas.
   */
  public void setAreaPermission(List<Area> areas, List<String> notPermissionArea) {
    for (Area area : areas) {
      if (area instanceof Partition && !notPermissionArea.contains(area.getId())) {
        setAreaPermission(area.getSpacesFromArea(), notPermissionArea);
      }

      if (area instanceof Space) {
        if (groupName.equals("admin") || groupName.equals("manager")) {
          areasPermissionForGroup.add(area);
        } else if (groupName.equals("employee") && !notPermissionArea.contains(area.getId())) {
          areasPermissionForGroup.add(area);
        }
      }
    }
  }

  public List<Area> getAreaPermission() {
    return areasPermissionForGroup;
  }

  /**
   * Method that checks if day is allowed.
   * @param dayToCheck is day to check.
   * @return a condition control boolean.
   */
  public boolean checkDay(LocalDateTime dayToCheck) {
    return this.hasAccess.checkDayWeek(dayToCheck.getDayOfWeek().getValue());
  }

  /**
   * Method that checks if time is allowed.
   * @param timeToCheck is time to check.
   * @return a condition control boolean.
   */
  public boolean checkTime(LocalDateTime timeToCheck) {
    return this.hasAccess.checkTime(timeToCheck.toLocalTime());
  }

  /**
   * Method that checks if date is allowed.
   * @param dateToCheck is date to check.
   * @return a condition control boolean.
   */
  public boolean checkPeriod(LocalDateTime dateToCheck) {
    return this.hasAccess.checkPeriod(dateToCheck.toLocalDate());
  }

  /**
   *  Sets all values of the object AllowAccess.
   * @param startTime gets the starting time to set into AllowAccess object.
   * @param endTime gets the end time to set into AllowAccess object.
   */
  private void  setAllowAccess(LocalDateTime startTime, LocalDateTime endTime) {
    if (startTime != null) {
      this.hasAccess.setStartPeriod(LocalDate.of(startTime.getYear(),
          startTime.getMonth(), startTime.getDayOfMonth()));
      this.hasAccess.setStartHour(LocalTime.of(startTime.getHour(), startTime.getMinute()));
    }

    if (endTime != null) {
      this.hasAccess.setEndPeriod(LocalDate.of(endTime.getYear(),
          endTime.getMonth(), endTime.getDayOfMonth()));
      this.hasAccess.setEndHour(LocalTime.of(endTime.getHour(), endTime.getMinute()));
    }

    switch (this.groupName) {
      case "admin":
        this.hasAccess.setStartDayWeek(1);
        this.hasAccess.setEndDayWeek(7);
        break;
      case "manager":
        this.hasAccess.setStartDayWeek(1);
        this.hasAccess.setEndDayWeek(6);
        break;
      case "employee":
        this.hasAccess.setStartDayWeek(1);
        this.hasAccess.setEndDayWeek(5);
        break;
      default:
        this.hasAccess.setStartDayWeek(0);
        this.hasAccess.setEndDayWeek(0);
        break;
    }
  }

  public String getGroupName() {
    return groupName;
  }

}
