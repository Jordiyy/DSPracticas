package baseNoStates.areas;

import baseNoStates.Door;

import java.util.ArrayList;
import java.util.Arrays;

public class Basement extends Area {

  public Basement(String areaName) {
    super(areaName);
    door = new Door[]{new Door("D1"),new Door("D2")};
  }
}
