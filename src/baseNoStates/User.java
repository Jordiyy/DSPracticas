package baseNoStates;

import java.util.ArrayList;
import java.util.List;

public class User {
  private final String name;
  private final String credential;
  //private List<String> accessibleSpaces;
  private UserGroup rol;

  public User(String name, String credential) {
    this.name = name;
    this.credential = credential;
    rol = null;
  }

  public String getCredential() {
    return credential;
  }

  @Override
  public String toString() {
    return "User{name=" + name + ", credential=" + credential + "}";
  }

  public void setRol (UserGroup group) {
    rol = group;
  }

  public UserGroup getRol() {
    return rol;
  }

  public boolean canBeInSpace(String spaceTo, String spaceFrom) {
    boolean cond1 = false, cond2 = false;
    List<Space> listSpaces = new ArrayList<>();
    listSpaces = rol.getSpacePermission();

    for (Space sp : listSpaces) {
      if (sp.getId().equals(spaceFrom)) {
        cond1 = true;
      }
      if (sp.getId().equals(spaceTo)) {
        cond2 = true;
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
        break;
      }
    }

    for (String space : accessibleSpaces) {
      if (space.equals(spaceFrom)) {
        cond2 = true;
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
