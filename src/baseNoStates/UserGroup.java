package baseNoStates;

import baseNoStates.areas.Area;
import baseNoStates.areas.Partition;
import baseNoStates.areas.Space;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Class that defines a group of user with his permissions to enter an Area.
 */
public class UserGroup {
  private final String groupName;           //Name of the UserGroup.
  private final List<User> userList;        //List of user that belongs to that UserGroup.
  private final AllowAccess access;         //Object that controls if a User has permissions
                                            // to access with date and time.
  private final List<Area> areaPermission;  //List of Areas that he UserGroup is allowed to acces.

  public UserGroup(String groupName, ArrayList<User> userList,
                   LocalDateTime startTime, LocalDateTime endTime) {
    this.groupName = groupName;
    this.userList = userList;
    this.access = new AllowAccess();

    setAllowAccess(startTime, endTime);

    areaPermission = new ArrayList<>();
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
      if (area instanceof Partition && !notPermissionArea.contains(area.getId())){
        setAreaPermission(area.getSpaces(), notPermissionArea);
      }

      if (area instanceof Space) {
        if(groupName=="admin" || groupName=="manager") {
          areaPermission.add(area);
        }else if (groupName=="employee" && !notPermissionArea.contains(area.getId())) {
          areaPermission.add(area);
        }

      }
    }
  }

  public List<Area> getAreaPermission() {
    return areaPermission;
  }

  /**
   * Method that checks if day is allowed.
   * @param dayToCheck is day to check.
   * @return a condition control boolean.
   */
  public boolean checkDay(LocalDateTime dayToCheck) {
    return this.access.checkDayWeek(dayToCheck.getDayOfWeek().getValue());
  }

  /**
   * Method that checks if time is allowed.
   * @param timeToCheck is time to check.
   * @return a condition control boolean.
   */
  public boolean checkTime(LocalDateTime timeToCheck) {
    return this.access.checkTime(timeToCheck.toLocalTime());
  }

  /**
   * Method that checks if date is allowed.
   * @param dateToCheck is date to check.
   * @return a condition control boolean.
   */
  public boolean checkPeriod(LocalDateTime dateToCheck) {
    return this.access.checkPeriod(dateToCheck.toLocalDate());
  }

  /**
   *  Sets all values of the object AllowAccess.
   * @param startTime gets the starting time to set into AllowAccess object.
   * @param endTime gets the end time to set into AllowAccess object.
   */
  private void  setAllowAccess(LocalDateTime startTime, LocalDateTime endTime) {
    if (startTime != null) {
      this.access.setStartPeriod(LocalDate.of(startTime.getYear(), startTime.getMonth(), startTime.getDayOfMonth()));
      this.access.setStartHour(LocalTime.of(startTime.getHour(), startTime.getMinute()));
    }

    if (endTime != null) {
      this.access.setEndPeriod(LocalDate.of(endTime.getYear(), endTime.getMonth(), endTime.getDayOfMonth()));
      this.access.setEndHour(LocalTime.of(endTime.getHour(), endTime.getMinute()));
    }

    switch (this.groupName) {
      case "admin":
        this.access.setStartingDayWeek(1);
        this.access.setEndDayWeek(7);
        break;
      case "manager":
        this.access.setStartingDayWeek(1);
        this.access.setEndDayWeek(6);
        break;
      case "employee":
        this.access.setStartingDayWeek(1);
        this.access.setEndDayWeek(5);
        break;
      default:
        this.access.setStartingDayWeek(0);
        this.access.setEndDayWeek(0);
        break;
    }
  }

}
