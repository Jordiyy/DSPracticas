package baseNoStates.areas;

import baseNoStates.Door;

import java.util.ArrayList;
import java.util.Arrays;

public abstract class Area {
  protected Door[] door;
  String areaBuilding;

  public Area(String areaName) {
    areaBuilding = areaName;
    door = getDoorsGivingAccess();
  }

  public Door[] getDoorsGivingAccess() {
    return door;
  }

  public String getAreaBuilding() {
    return areaBuilding;
  }
}
