package baseNoStates;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DirectoryUserGroups {
  private static final ArrayList<UserGroup> userGroups = new ArrayList<>();
  static Logger logger = LoggerFactory.getLogger(DirectoryUserGroups.class);

  public static void makeUserGroups() throws ParseException {
    //TODO: make user groups according to the specifications in the comments, because
    // now all are the same

    // users without any privilege, just to keep temporally users instead of deleting them,
    // this is to withdraw all permissions but still to keep user data to give back
    // permissions later
    UserGroup ug1 = new UserGroup("admin", new ArrayList<User>(), null, null);
    UserGroup ug2 = new UserGroup("manager", new ArrayList<User>(), "08:00:00", "20:00:00");
    UserGroup ug3 = new UserGroup("employee", new ArrayList<User>(), "09:00:00", "17:00:00");
    UserGroup ug4 = new UserGroup("noGroup", new ArrayList<User>(), null, null);

    //ug1.setSpacePermission(new ArrayList<>(Arrays.asList("building", "ground_floor", "floor1", "exterior", "stairs", "basement", "parking", "hall", "room1", "room2", "room3", "corridor", "IT")));
    //ug2.setSpacePermission(new ArrayList<>(Arrays.asList("building", "ground_floor", "floor1", "exterior", "stairs", "basement", "parking", "hall", "room1", "room2", "room3", "corridor", "IT")));
    //ug3.setSpacePermission(new ArrayList<>(Arrays.asList("hall", "room1", "room2", "room3", "corridor", "IT", "exterior", "stairs")));

    User u1 = new User("Bernat", "12345"); // "noGroup"
    User u2 = new User("Blai", "77532"); //, "noGroup"
    User u3 = new User("Ernest", "74984"); //, "employee"
    User u4 = new User("Eulalia", "43295"); //, "employee"
    User u5 = new User("Manel", "95783"); //, "manager"
    User u6 = new User("Marta", "05827"); //, "manager"
    User u7 = new User("Ana", "11343"); //, "admin"

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
    List<User> userList = new ArrayList<User>();
    for (UserGroup group : userGroups) {
      userList = group.getUserList();
      for (User user : userList) {
        if (user.getCredential().equals(credential)) {
          return user;
        }
      }
    }
    logger.info("user with credential " + credential + " not found");
    return null; // otherwise we get a Java error
  }

  public static ArrayList<UserGroup> getUserGroups() {
    return userGroups;
  }

}
