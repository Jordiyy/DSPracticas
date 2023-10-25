package baseNoStates;
import baseNoStates.areas.Area;

import java.util.List;

public class User {
  private final String name;
  private final String credential;
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

  public boolean canBeInSpace(String areaTo, String areaFrom) {
    boolean areaFromFound = false;
    boolean areaToFound = false;
    List<Area> listArea = rol.getSpacePermission();

    for (Area area : listArea) {
      if (area.getId().equals(areaFrom)) { areaFromFound = true; }
      if (area.getId().equals(areaTo)) { areaToFound = true; }
      if (areaFromFound && areaToFound) { break; }
    }

    return areaFromFound && areaToFound;
  }
}
