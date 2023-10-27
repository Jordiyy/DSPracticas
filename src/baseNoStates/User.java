package baseNoStates;

import baseNoStates.UserGroup;
import baseNoStates.areas.Area;
import java.time.LocalDateTime;
import java.util.List;

public class User {
  private final String name;
  private final String credential;
  private final UserGroup rol;

  public User(String name, String credential, UserGroup rol) {
    this.name = name;
    this.credential = credential;
    this.rol = rol;
  }

  public String getCredential() {
    return credential;
  }

  /**
   * Return a string representation of the User object.
   * @return a string with the username and credentials.
   */
  @Override
  public String toString() {
    return "User{name=" + name + ", credential=" + credential + "}";
  }

  /**
   * Method that checks if a user has permissions to go from one area to another through a door
   * @param areaTo is the to area
   * @param areaFrom is the from area
   * @return a boolean to control whether the user has access to the two areas
   */
  public boolean canBeInArea(String areaTo, String areaFrom) {
    boolean areaFromFound = false;
    boolean areaToFound = false;
    List<Area> listArea = rol.getAreaPermission();

    for (Area area : listArea) {
      if (area.getId().equals(areaFrom)) {
        areaFromFound = true;
      }
      if (area.getId().equals(areaTo)) {
        areaToFound = true;
      }
      if (areaFromFound && areaToFound) {
        break;
      }
    }

    return areaFromFound && areaToFound;
  }

  /**
   * Method that checks if time is allowed for a role.
   * @param time is time to check.
   * @return a condition control boolean.
   */
  public boolean checkTime(LocalDateTime time) {
    return rol.checkTime(time);
  }

  /**
   * Method that checks if date is allowed for a role.
   * @param date is date to check.
   * @return a condition control boolean.
   */
  public boolean checkDate(LocalDateTime date) {
    return rol.checkPeriod(date);
  }

  /**
   * Method that checks if day is allowed for a role.
   * @param day is day to check.
   * @return a condition control boolean.
   */
  public boolean checkDayWeek(LocalDateTime day) {
    return rol.checkDay(day);
  }

  public UserGroup getRol() {
    return rol;
  }

}
