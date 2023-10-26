package baseNoStates;

import baseNoStates.areas.Area;
import baseNoStates.areas.Partition;
import baseNoStates.areas.Space;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class UserGroup {
  private final String groupName;
  private List<User> userList = new ArrayList<User>();
  private AllowAccess access;
  private List<Area> spacePermission = new ArrayList<>();

  public UserGroup(String groupName, ArrayList<User> userList, LocalDateTime startTime, LocalDateTime endTime) {
    this.groupName = groupName;
    this.userList = userList;
    this.access = new AllowAccess();

    setAllowAccess(startTime, endTime);

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

  public void setSpacePermission(List<Area> areas, List<String> notPermisionArea) {
    for (Area area : areas) {
      if (area instanceof Partition && !notPermisionArea.contains(area.getId()))
        setSpacePermission(area.getSpaces(), notPermisionArea);

      if (area instanceof Space) {
        if(groupName=="admin" || groupName=="manager")
          spacePermission.add(area);
        else if (groupName=="employee" && !notPermisionArea.contains(area.getId())) {
          spacePermission.add(area);
        }
      }
    }
  }

  public List<Area> getSpacePermission() {
    return spacePermission;
  }

  public boolean checkDay(LocalDateTime dayToCheck) {
    return this.access.checkDayWeek(dayToCheck.getDayOfWeek().getValue());
  }

  public boolean checkTime(LocalDateTime timeToCheck) {
    return this.access.checkTime(timeToCheck.toLocalTime());
  }

  public boolean checkPeriod(LocalDateTime dateToCheck) {
    return this.access.checkPeriod(dateToCheck.toLocalDate());
  }

  private void  setAllowAccess(LocalDateTime startTime, LocalDateTime endTime) {
    if (startTime != null) {
      this.access.setStartPeriod(LocalDate.of(startTime.getYear(), startTime.getMonth(), startTime.getDayOfMonth()));
      this.access.setStartHour(LocalTime.of(startTime.getHour(), startTime.getMinute()));
    }

    if (endTime != null) {
      this.access.setEndPeriod(LocalDate.of(endTime.getYear(), endTime.getMonth(), endTime.getDayOfMonth()));
      this.access.setEndHour(LocalTime.of(endTime.getHour(), endTime.getMinute()));
    }

    switch (this.groupName) {
      case "admin":
        this.access.setStartingDayWeek(1);
        this.access.setEndDayWeek(7);
        break;
      case "manager":
        this.access.setStartingDayWeek(1);
        this.access.setEndDayWeek(6);
        break;
      case "employee":
        this.access.setStartingDayWeek(1);
        this.access.setEndDayWeek(5);
        break;
      default:
        this.access.setStartingDayWeek(0);
        this.access.setEndDayWeek(0);
        break;
    }
  }

}
