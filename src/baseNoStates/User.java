package baseNoStates;

import baseNoStates.areas.Space;

import java.util.ArrayList;
import java.util.List;

public class User {
  private final String name;
  private final String credential;
  //private List<String> accessibleSpaces;
  private String rol;

  public User(String name, String credential, String rol/*, List<String> accessibleSpaces*/) {
    this.name = name;
    this.credential = credential;
    this.rol = rol;
    //this.accessibleSpaces = accessibleSpaces;
  }

  public String getCredential() {
    return credential;
  }

  @Override
  public String toString() {
    return "User{name=" + name + ", credential=" + credential + "}";
  }

  public boolean canBeInSpace(String spaceTo, String spaceFrom) {
    if (rol.equals("admin") || rol.equals("manager")) {
      return true;
    }

    if (rol.equals("noGroup")) {
      return false;
    }

    boolean cond1 = false, cond2 = false;

    ArrayList<UserGroup> listSpaces;
    listSpaces = DirectoryUserGroups.getUserGroups();
    for (UserGroup group : listSpaces) {
      if (group.getGroupName().equals("employee")) {
        for (String s : group.getSpacePermission()) {
          if (s.equals(spaceFrom)) {
            cond1 = true;
          }

          if (s.equals(spaceTo)) {
            cond2 = true;
          }
        }
      }
    }

    return cond1 && cond2;
  }

  /*public boolean canBeInSpace(String spaceTo, String spaceFrom) {
    boolean cond1 = false;
    boolean cond2 = false;

    for (String space : accessibleSpaces) {
      if (space.equals(spaceTo)) {
        cond1 = true;
      }

      if (space.equals(spaceFrom)) {
        cond2 = true;
      }

      if (cond1 && cond2) {
        break;
      }
    }

    return (cond1) && (cond2);
  }

  public void setSpacesToBe(List<String> possiblesSpaces) {
    accessibleSpaces = possiblesSpaces;
  }

  private List<String> getSpaces() {
    return accessibleSpaces;
  }*/


}
