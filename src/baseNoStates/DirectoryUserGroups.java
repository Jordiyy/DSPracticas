package baseNoStates;

import baseNoStates.areas.Area;
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
    UserGroup admin = new UserGroup("admin", new ArrayList<User>(), null, null);
    UserGroup manager = new UserGroup("manager", new ArrayList<User>(), "08:00:00", "20:00:00");
    UserGroup employee = new UserGroup("employee", new ArrayList<User>(), "09:00:00", "17:00:00");
    UserGroup noGroup = new UserGroup("noGroup", new ArrayList<User>(), null, null);

    User u1 = new User("Bernat", "12345", noGroup); // "noGroup"
    User u2 = new User("Blai", "77532", noGroup); //, "noGroup"
    User u3 = new User("Ernest", "74984", employee); //, "employee"
    User u4 = new User("Eulalia", "43295", employee); //, "employee"
    User u5 = new User("Manel", "95783", manager); //, "manager"
    User u6 = new User("Marta", "05827", manager); //, "manager"
    User u7 = new User("Ana", "11343", admin); //, "admin"

    admin.addUser(u7);
    manager.addAllUsers(new ArrayList<>(Arrays.asList(u5, u6)));
    employee.addAllUsers(new ArrayList<>(Arrays.asList(u3, u4)));
    noGroup.addAllUsers(new ArrayList<>(Arrays.asList(u1, u2)));

    userGroups.addAll(new ArrayList<>(Arrays.asList(admin, manager, employee, noGroup)));

    Area area = DirectoryAreas.findAreaById("building");
    userGroups.get(0).setAreaPermission(area.getSpaces(), new ArrayList<>(List.of("")));
    userGroups.get(1).setAreaPermission(area.getSpaces(), new ArrayList<>(List.of("")));
    userGroups.get(2).setAreaPermission(area.getSpaces(), new ArrayList<>(List.of("parking")));

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
}
