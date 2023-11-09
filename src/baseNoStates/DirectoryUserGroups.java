package baseNoStates;

import baseNoStates.areas.Area;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DirectoryUserGroups {
  private static final List<UserGroup> userGroups = new ArrayList<>();
  static Logger logger = LoggerFactory.getLogger(DirectoryUserGroups.class);

  /**
   * Create all Users, UserGroups and UserGroup permissions that the application will use.
   */
  public static void makeUserGroups() throws ParseException {
    logger.debug("Groups, Users and Permissions initialization.");

    UserGroup admin = new UserGroup("admin", new ArrayList<User>(),
        LocalDateTime.of(2023, 1, 1, 0, 0), LocalDateTime.of(2100, 12, 31, 23, 59));
    UserGroup manager = new UserGroup("manager", new ArrayList<User>(),
        LocalDateTime.of(2023, 9, 1, 8, 0), LocalDateTime.of(2024, 3, 1, 20, 0));
    UserGroup employee = new UserGroup("employee", new ArrayList<User>(),
        LocalDateTime.of(2023, 9, 1, 9, 0), LocalDateTime.of(2024, 3, 1, 17, 0));
    UserGroup blank = new UserGroup("blank", new ArrayList<User>(), null, null);

    User u1 = new User("Bernat", "12345", blank); // "blank"
    User u2 = new User("Blai", "77532", blank); //, "blank"
    blank.addAllUsers(new ArrayList<>(Arrays.asList(u1, u2)));

    User u3 = new User("Ernest", "74984", employee); //, "employee"
    User u4 = new User("Eulalia", "43295", employee); //, "employee"
    employee.addAllUsers(new ArrayList<>(Arrays.asList(u3, u4)));

    User u5 = new User("Manel", "95783", manager); //, "manager"
    User u6 = new User("Marta", "05827", manager); //, "manager"
    manager.addAllUsers(new ArrayList<>(Arrays.asList(u5, u6)));

    User u7 = new User("Ana", "11343", admin); //, "admin"
    admin.addUser(u7);

    userGroups.addAll(new ArrayList<>(Arrays.asList(admin, manager, employee, blank)));

    Area area = DirectoryAreas.findAreaById("building");
    userGroups.get(0).setAreaPermission(area.getSpaces(), new ArrayList<>(List.of("")));
    userGroups.get(1).setAreaPermission(area.getSpaces(),  new ArrayList<>(List.of("")));
    userGroups.get(2).setAreaPermission(area.getSpaces(),  new ArrayList<>(List.of("parking")));
  }

  public static User findUserByCredential(String credential) {
    List<User> userList;

    for (UserGroup group : userGroups) {
      userList = group.getUserList();
      for (User user : userList) {
        if (user.getCredential().equals(credential)) {
          logger.debug("User with credential " + credential + " found.");
          return user;
        }
      }
    }

    logger.warn("User with credential " + credential + " not found.");
    return null; // otherwise we get a Java error
  }

}
