package baseNoStates;

import baseNoStates.areas.*;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;

public class DirectoryAreas {
  private static ArrayList<Area> allAreas;
  private static Area area;
  static Logger logger = LoggerFactory.getLogger(DirectoryAreas.class);
  public DirectoryAreas() {
    area = null;
    allAreas = null;
    logger.info("TEST");
  }

  public static void makeAreas() {
    /*
    Area a1 = new Partition("building");
    Area a2 = new Partition("basement");
    Area a3 = new Space("parking");
    Area a4 = new Partition("ground_floor");
    Area a5 = new Space("hall");
    Area a6 = new Space("room1");
    Area a7 = new Space("room2");
    Area a8 = new Partition("floor1");
    Area a9 = new Space("room3");
    Area a10 = new Space("corridor");
    Area a11 = new Space("IT");
    Area a12 = new Partition("stairs");
    Area a13 = new Partition("exterior");

    allAreas = new ArrayList<>(Arrays.asList(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13));
    */
  }

  public static Area findAreaById(String areaId) {
    for (Area area : allAreas) {
      if (area.getAreaBuilding().equals(areaId)) {
        return area;
      }
    }
    logger.info("area with id " + areaId + " not found");
    return null;
  }

}
