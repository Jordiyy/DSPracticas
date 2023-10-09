package baseNoStates.areas;

import baseNoStates.Door;

import java.util.ArrayList;

public class Partition extends Area {
  /**
   * solo se que tiene que haber un arraylist de Area
   */
  //ArrayList<Area> contentTree;
  ArrayList<Area> children = new ArrayList<Area>();

  public Partition(String areaName, Area fromNode, Area nodeContent) {
    super(areaName, fromNode);
    children.add(nodeContent);
  }
}
