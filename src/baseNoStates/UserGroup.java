package baseNoStates;

import baseNoStates.areas.Area;
import baseNoStates.areas.Partition;
import baseNoStates.areas.Space;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class UserGroup {
  private final List<User> userList;
  private final List<Area> spacePermission;
  private final String groupName;
  private final Calendar startTime;
  private final Calendar endTime;


  public UserGroup(String groupName, ArrayList<User> userList, String startTime, String endTime) throws ParseException {
    this.groupName = groupName;
    this.userList = userList;

    if (startTime != null) {
      Date time1 = new SimpleDateFormat("HH:mm:ss").parse(startTime);
      this.startTime = Calendar.getInstance();
      this.startTime.setTime(time1);
      this.startTime.add(Calendar.DATE, 1);
    } else {
      this.startTime = null;
    }

    if (endTime != null) {
      Date time2 = new SimpleDateFormat("HH:mm:ss").parse(endTime);
      this.endTime = Calendar.getInstance();
      this.endTime.setTime(time2);
      this.endTime.add(Calendar.DATE, 1);
    } else {
      this.endTime = null;
    }

    spacePermission = new ArrayList<Area>();
  }
  public List<User> getUserList() {
    return userList;
  }

  public void addUser(User user) {
    userList.add(user);
  }

  public void addAllUsers(ArrayList<User> arrayUsers) {
    userList.addAll(arrayUsers);
  }

  public void setAreaPermission(List<Area> areas, List<String> notPermissionArea) {
    for (Area area : areas) {
      if (area instanceof Partition && !notPermissionArea.contains(area.getId()))
        setAreaPermission(area.getSpaces(), notPermissionArea);

      if (area instanceof Space) {
        if(groupName=="admin" || groupName=="manager")
          spacePermission.add(area);
        else if (groupName=="employee" && !notPermissionArea.contains(area.getId()))
          spacePermission.add(area);
      }
    }
  }

  public List<Area> getSpacePermission() { return spacePermission; }
  //Cambiarlo completo

  private int getDayAsInt(String day) {
    switch (day) {
      case "Monday":
        return 2;

      case "Tuesday":
        return 3;

      case "Wednesday":
        return 4;

      case "Thursday":
        return 5;

      case "Friday":
        return 6;

      case "Saturday":
        return 7;

      case "Sunday":
        return 1;

      default:
        return 0;
    }
  }
}
