package baseNoStates.areas;

import baseNoStates.Door;

public abstract class Area {
  protected Door[] door;
  String areaBuilding;

  public Area(String areaName) {
    areaBuilding = areaName;
    door = getDoorsGivingAccess();
  }

  public Door[] getDoorsGivingAccess() {
    return null;
  }
}
