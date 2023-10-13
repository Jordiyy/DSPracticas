package baseNoStates;

import baseNoStates.areas.Space;

public class User {
  private final String name;
  private final String credential;
  private Space[] accessibleSpaces;

  public User(String name, String credential) {
    this.name = name;
    this.credential = credential;
  }

  public String getCredential() {
    return credential;
  }

  @Override
  public String toString() {
    return "User{name=" + name + ", credential=" + credential + "}";
  }

  public boolean canBeInSpace(Space sp) {
    //cuando este implementado los espacios que puede acceder.
    /*for (Space space : accessibleSpaces) {
      if (space.getId().equals(sp))
        return true;
    }
    return false;*/
    return true;
  }

  public void setSpacesToBe(Space[] possiblesSpaces) {
    accessibleSpaces = possiblesSpaces;
  }

  private Space[] getSpaces() {
    return accessibleSpaces;
  }
}
