/*
package baseNoStates;

import baseNoStates.Space;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class DirectoryUsers {
  private static final ArrayList<User> users = new ArrayList<>();
  static Logger logger = LoggerFactory.getLogger(DirectoryUsers.class);

  public static void makeUsers() {
    //TODO: make user groups according to the specifications in the comments, because
    // now all are the same

    // users without any privilege, just to keep temporally users instead of deleting them,
    // this is to withdraw all permissions but still to keep user data to give back
    // permissions later
    List<String> possibleSpaces;
    possibleSpaces = new ArrayList<String>();
    users.add(new User("Bernat", "12345", possibleSpaces));
    users.add(new User("Blai", "77532", possibleSpaces));

    // employees :
    // Sep. 1 2023 to Mar. 1 2024
    // week days 9-17h
    // just shortly unlock
    // ground floor, floor1, exterior, stairs (this, for all), that is, everywhere but the parking
    possibleSpaces = new ArrayList<String>(Arrays.asList("hall", "room1", "room2", "room3", "corridor", "IT", "exterior", "stairs"));
    users.add(new User("Ernest", "74984", possibleSpaces));
    users.add(new User("Eulalia", "43295", possibleSpaces));

    // managers :
    // Sep. 1 2023 to Mar. 1 2024
    // week days + saturday, 8-20h
    // all actions
    // all spaces
    possibleSpaces = new ArrayList<String>(Arrays.asList("building", "ground_floor", "floor1", "exterior", "stairs", "basement", "parking", "hall", "room1", "room2", "room3", "corridor", "IT"));
    users.add(new User("Manel", "95783", possibleSpaces));
    users.add(new User("Marta", "05827", possibleSpaces));

    // admin :
    // always=2023 to 2100
    // all days of the week
    // all actions
    // all spaces
    users.add(new User("Ana", "11343", possibleSpaces));
  }

  public static User findUserByCredential(String credential) {
    for (User user : users) {
      if (user.getCredential().equals(credential)) {
        return user;
      }
    }
    logger.info("user with credential " + credential + " not found");
    return null; // otherwise we get a Java error
  }

}
*/