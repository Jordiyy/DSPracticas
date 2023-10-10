package baseNoStates.areas;

import baseNoStates.Door;

public class Space extends Area {
  Door[] doorsInSpace;

  /**
   *No estoy nada seguro de si tendria que ser asi o similar el cosntructor
   */
  public Space(String areaName, String infoArea, Area fatherNode, Door[] doorsAvailable) {
    super(areaName, infoArea, fatherNode);
    doorsInSpace = doorsAvailable;
  }

  public Door[] getDoorsSpace() {
    return doorsInSpace;
  }
}
