package baseNoStates;
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
  @Override
  public String toString() {
    return "User{name=" + name + ", credential=" + credential + "}";
  }

  public boolean canBeInArea(String areaTo, String areaFrom) {
    boolean areaFromFound = false;
    boolean areaToFound = false;
    List<Area> listArea = rol.getAreaPermission();

    for (Area area : listArea) {
      if (area.getId().equals(areaFrom)) { areaFromFound = true; }
      if (area.getId().equals(areaTo)) { areaToFound = true; }
      if (areaFromFound && areaToFound) { break; }
    }

    return areaFromFound && areaToFound;
  }

  public boolean checkTime(LocalDateTime time) {
    return rol.checkTime(time);
  }

  public boolean checkDate(LocalDateTime date) { return rol.checkPeriod(date); }

  public boolean checkDayWeek(LocalDateTime day) {
    return rol.checkDay(day);
  }

}
