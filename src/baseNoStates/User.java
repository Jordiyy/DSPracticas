package baseNoStates;

import java.time.LocalDateTime;
import java.util.ArrayList;
import baseNoStates.areas.Area;
import java.util.List;

public class User {
  private final String name;
  private final String credential;
  //private List<String> accessibleSpaces;
  private UserGroup rol;

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

  public void setRol(UserGroup group) {
    rol = group;
  }

  public UserGroup getRol() {
    return rol;
  }

  public boolean canBeInSpace(String spaceTo, String spaceFrom) {
    boolean cond1 = false;
    boolean cond2 = false;
    List<Area> listSpaces = new ArrayList<>();
    listSpaces = rol.getSpacePermission();

    for (Area area : listSpaces) {
      cond1 = area.getId().equals(spaceFrom) || cond1;
      cond2 = area.getId().equals(spaceTo) || cond2;
    }

    return cond1 && cond2;
  }

  public boolean checkTime(LocalDateTime time) {
    return rol.checkTime(time);
  }

  public boolean checkDate(LocalDateTime date) {
    return rol.checkPeriod(date);
  }

  public boolean checkDayWeek(LocalDateTime day) {
    return rol.checkDay(day);
  }

}
