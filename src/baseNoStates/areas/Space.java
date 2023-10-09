package baseNoStates.areas;

import baseNoStates.Door;

public class Space extends Area {
  Door[] doorsInSpace;

  /**
   *No estoy nada seguro de si tendria que ser asi o similar el cosntructor
   */
  public Space(String areaName, Area fromNode, Door[] doorsAvailable) {
    super(areaName, fromNode);
    doorsInSpace = doorsAvailable;
  }

  public Door[] getDoorsSpace() {
    return doorsInSpace;
  }
}
