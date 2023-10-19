package baseNoStates;

import baseNoStates.areas.Area;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class UserGroup {
  private final String groupName;
  private List<User> userList = new ArrayList<User>();
  private final LocalDateTime startTime;
  private final LocalDateTime endTime;
  private List<Area> spacePermission = new ArrayList<>();

  public UserGroup(String groupName, ArrayList<User> userList, LocalDateTime startTime, LocalDateTime endTime) throws ParseException {
    this.groupName = groupName;
    this.userList = userList;

    if (startTime != null) {
      /*Date time1 = new SimpleDateFormat("HH:mm:ss").parse(startTime);
      this.startTime = Calendar.getInstance();
      this.startTime.setTime(time1);
      this.startTime.add(Calendar.DATE, 1);*/
      this.startTime = startTime;
    } else {
      this.startTime = null;
    }

    if (endTime != null) {
      /*Date time2 = new SimpleDateFormat("HH:mm:ss").parse(endTime);
      this.endTime = Calendar.getInstance();
      this.endTime.setTime(time2);
      this.endTime.add(Calendar.DATE, 1);*/
      this.endTime = endTime;
    } else {
      this.endTime = null;
    }

    spacePermission = new ArrayList<Area>();
  }

  public String getGroupName() {
    return groupName;
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

  public void removeUser(User user) {
    userList.remove(user);
  }

  public String userInGroup(User user) {
    for (User u : userList) {
      if (u.equals(user)) {
        return this.groupName;
      }
    }
    return null;
  }

  public void setSpacePermission(List<Area> list) {
    this.spacePermission = list;
  }

  public List<Area> getSpacePermission() {
    return spacePermission;
  }
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

  public boolean checkDay(String dayToCheck) {
    int dayAsInt = getDayAsInt(dayToCheck);

    if (this.getGroupName().equals("admin")) {
      return true;
    }

    if (this.getGroupName().equals("manager")) {
      return dayAsInt >= Calendar.MONDAY && dayAsInt <= Calendar.SATURDAY;
    }

    if (this.getGroupName().equals("employee")) {
      return dayAsInt >= Calendar.MONDAY && dayAsInt <= Calendar.FRIDAY;
    }

    return false;
  }

  public boolean checkTime(LocalDateTime timeToCheck) throws ParseException {
    if (this.getGroupName().equals("admin")) {
      return true;
    }

    if (this.getGroupName().equals("noGroup")) {
      return false;
    }

    //Date check = new SimpleDateFormat("HH:mm:ss").parse(timeToCheck);

    return timeToCheck.isAfter(startTime) && timeToCheck.isBefore(endTime);
    //Si el parametro es de tipo Date se borran las 2 lineas de arriba
    //return timeToCheck.after(startTime.getTime()) && timeToCheck.before(endTime.getTime());
  }

}
