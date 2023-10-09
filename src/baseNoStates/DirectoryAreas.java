package baseNoStates;

import baseNoStates.areas.*;
import org.slf4j.LoggerFactory;
import org.slf4j.Logger;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;

public class DirectoryAreas {
  private static ArrayList<Area> allAreas;
  private static Area rootArea;
  static Logger logger = LoggerFactory.getLogger(DirectoryAreas.class);
  public DirectoryAreas() {
    rootArea = new Area("root", null) {};
    allAreas = null;
    logger.info("TEST");
  }

  public static void makeAreas() {
    Door d1 = new Door("D1");
    Door d2 = new Door("D2");
    Door[] parkingDoors = new Door[] {d1, d2};

    //opcion 1
    Partition building = null;
    Partition basement = null;
    Space parking = new Space("parking", basement, parkingDoors);
    basement = new Partition("basement", building, parking);
    building = new Partition("building", null, basement);

    //opcion 2
    /*
    Partition building = new Partition("building", null, null);
    Partition basement = new Partition("basement", building, null);;
    Space parking = new Space("parking", basement, parkingDoors);
    building.setChildrenTree(basement);
    basement.setChildrenTree(parking);
    */

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
      if (area.getAreaBuilding().equals(areaId)) { return area; }
    }
    logger.info("area with id " + areaId + " not found");
    return null;
  }

  public Door findDoorById(String doorId) {
    ArrayList<Door> allDoors = DirectoryDoors.getAllDoors();
    for (Door door : allDoors) {
      if (doorId.equalsIgnoreCase(door.getId())) { return door; }
    }
    logger.info("door with id " + doorId + " not found");
    return null;
  }

  public Door[] getAllDoors() {
    Object[] allDoors = new Object[] {DirectoryDoors.getAllDoors().toArray()};
    if (allDoors.length > 0) { return (Door[]) allDoors; }
    logger.info("doors not created");
    return null;
  }
}
