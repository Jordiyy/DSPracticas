package baseNoStates.areas;

import baseNoStates.Door;

public class Parking extends Area{

  public Parking(String areaName) {
    super(areaName);
    door = new Door[]{new Door("D1")};
  }
}
