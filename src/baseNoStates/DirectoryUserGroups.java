package baseNoStates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DirectoryUserGroups {
  private static final ArrayList<UserGroup> userGroups = new ArrayList<>();
  static Logger logger = LoggerFactory.getLogger(DirectoryUsers.class);

  public static void makeUserGroups() throws ParseException {
    //TODO: make user groups according to the specifications in the comments, because
    // now all are the same

    // users without any privilege, just to keep temporally users instead of deleting them,
    // this is to withdraw all permissions but still to keep user data to give back
    // permissions later
    UserGroup ug1 = new UserGroup("admin", null, null, null);
    UserGroup ug2 = new UserGroup("managers", null, "08:00:00", "20:00:00");
    UserGroup ug3 = new UserGroup("employees", null, "09:00:00", "17:00:00");
    UserGroup ug4 = new UserGroup("noGroup", null, null, null);

    User u1 = new User("Bernat", "12345");
    User u2 = new User("Blai", "77532");
    User u3 = new User("Ernest", "74984");
    User u4 = new User("Eulalia", "43295");
    User u5 = new User("Manel", "95783");
    User u6 = new User("Marta", "05827");
    User u7 = new User("Ana", "11343");

    ug1.addUser(u7);
    ug2.addAllUsers(new ArrayList<>(Arrays.asList(u5, u6)));
    ug3.addAllUsers(new ArrayList<>(Arrays.asList(u3, u4)));
    ug4.addAllUsers(new ArrayList<>(Arrays.asList(u1, u2)));

    userGroups.addAll(new ArrayList<>(Arrays.asList(ug1, ug2, ug3, ug4)));

    // employees :
    // Sep. 1 2023 to Mar. 1 2024
    // week days 9-17h
    // just shortly unlock
    // ground floor, floor1, exterior, stairs (this, for all), that is, everywhere but the parking
    //Ernest
    //Eulalia

    // managers :
    // Sep. 1 2023 to Mar. 1 2024
    // week days + saturday, 8-20h
    // all actions
    // all spaces
    //Manel
    //Marta

    // admin :
    // always=2023 to 2100
    // all days of the week
    // all actions
    // all spaces
    //Ana
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
