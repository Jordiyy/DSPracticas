package baseNoStates.areas;

import baseNoStates.Door;

import java.util.ArrayList;

public class Partition extends Area {
  /**
   * solo se que tiene que haber un arraylist de Area
   */
  //ArrayList<Area> contentTree;
  ArrayList<Area> children = new ArrayList<Area>();

  public Partition(String areaName, String infoArea, Partition fatherNode) {
    super(areaName, infoArea, fatherNode);
  }

  public void addPartition(Area nodeContent) {
    children.add(nodeContent);
  }
}
