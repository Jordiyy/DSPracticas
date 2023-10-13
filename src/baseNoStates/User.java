package baseNoStates;

import baseNoStates.areas.Space;

public class User {
  private final String name;
  private final String credential;
  private String[] accessibleSpaces;

  public User(String name, String credential, String[] accessibleSpaces) {
    this.name = name;
    this.credential = credential;
    this.accessibleSpaces = accessibleSpaces;
  }

  public String getCredential() {
    return credential;
  }

  @Override
  public String toString() {
    return "User{name=" + name + ", credential=" + credential + "}";
  }

  public boolean canBeInSpace(String spaceTo, String spaceFrom) {
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

  public void setSpacesToBe(String[] possiblesSpaces) {
    accessibleSpaces = possiblesSpaces;
  }

  private String[] getSpaces() {
    return accessibleSpaces;
  }
}
