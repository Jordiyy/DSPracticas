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
  private final List<User> userList;
  private final AllowAccess access;
  private final List<Area> areaPermission;

  public UserGroup(String groupName, ArrayList<User> userList, LocalDateTime startTime, LocalDateTime endTime) {
    this.groupName = groupName;
    this.userList = userList;
    this.access = new AllowAccess();

    setAllowAccess(startTime, endTime);

    areaPermission = new ArrayList<>();
  }

  public List<User> getUserList() {
    return userList;
  }

  public void addUser(User user) {
    userList.add(user);
  }

  public void addAllUsers(List<User> arrayUsers) {
    userList.addAll(arrayUsers);
  }

  public void setAreaPermission(List<Area> areas, List<String> notPermissionArea) {
    for (Area area : areas) {
      if (area instanceof Partition && !notPermissionArea.contains(area.getId())){
        setAreaPermission(area.getSpaces(), notPermissionArea);
      }

      if (area instanceof Space) {
        if(groupName=="admin" || groupName=="manager") {
          areaPermission.add(area);
        }else if (groupName=="employee" && !notPermissionArea.contains(area.getId())) {
          areaPermission.add(area);
        }

      }
    }
  }

  public List<Area> getAreaPermission() { return areaPermission; }

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
