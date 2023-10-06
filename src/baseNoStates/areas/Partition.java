package baseNoStates.areas;

import baseNoStates.Door;

import java.util.ArrayList;

public class Partition extends Area {
  /**
   * solo se que tiene que haber un arraylist de Area
   */
  ArrayList<Area> contentTree;

  public Partition(String areaName, Area nodeContent, Area fromNode) {
    super(areaName, nodeContent, fromNode);
  }
}
