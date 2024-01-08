package basenostates;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import basenostates.doorstates.Door;
import basenostates.visitor.VisitorFindAreaById;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Class that defines the different Areas and doors.
 */
public final class DirectoryAreas {
  private static List<Door> allDoors;
  private static Area rootArea;
  static Logger logger = LoggerFactory.getLogger("Fita1");

  /**
   * Method that initializes the areas and doors.
   */
  public static void makeAreas() {
    logger.debug("Areas and Doors initialization.");

    Partition building = new Partition("building", "...", null);

    Partition basement = new Partition("basement", "...", building);
    Partition groundFloor = new Partition("ground_floor", "...", building);
    Partition floor1 = new Partition("floor1", "...", building);

    Space parking = new Space("parking", "...", basement);
    Space hall = new Space("hall", "...", groundFloor);
    Space room1 = new Space("room1", "...", groundFloor);
    Space room2 = new Space("room2", "...", groundFloor);
    Space room3 = new Space("room3", "...", floor1);
    Space corridor = new Space("corridor", "...", floor1);
    Space it = new Space("IT", "...", floor1);
    Space stairs = new Space("stairs", "...", building);
    Space exterior = new Space("exterior", "...", building);

    Door d1 = new Door("D1", exterior, parking);
    Door d2 = new Door("D2", stairs, parking);
    Door d3 = new Door("D3", exterior, hall);
    Door d4 = new Door("D4", stairs, hall);
    Door d5 = new Door("D5", hall, room1);
    Door d6 = new Door("D6", hall, room2);
    Door d7 = new Door("D7", stairs, corridor);
    Door d8 = new Door("D8", corridor, room3);
    Door d9 = new Door("D9", corridor, it);

    allDoors = new ArrayList<>(Arrays.asList(d1, d2, d3, d4, d5, d6, d7, d8, d9));

    parking.setDoorsToSpace(new ArrayList<>(Arrays.asList(d1, d2)));
    hall.setDoorsToSpace(new ArrayList<>(Arrays.asList(d3, d4)));
    room1.setOneDoorToSpace(d5);
    room2.setOneDoorToSpace(d6);
    room3.setOneDoorToSpace(d8);
    corridor.setOneDoorToSpace(d7);
    it.setOneDoorToSpace(d9);

    basement.setAreaToPartition(parking);
    groundFloor.setAllAreasToPartition(new ArrayList<>(Arrays.asList(hall, room1, room2)));
    floor1.setAllAreasToPartition(new ArrayList<>(Arrays.asList(room3, corridor, it)));

    building.setAllAreasToPartition(new ArrayList<>(
        Arrays.asList(basement, groundFloor, floor1, stairs, exterior)));

    rootArea = building;
  }

  /**
   * Method that searches for an area from an id.
   * @param areaId is the id of the area to search.
   * @return area found.
   */
  public static Area findAreaById(String areaId) {
    if(areaId.equals("ROOT"))
    {
      return rootArea;
    } else {
      rootArea.setIdToSearch(areaId);
      rootArea.accept(new VisitorFindAreaById());
      return VisitorFindAreaById.getFoundArea();
    }
  }

  /**
   * Method that searches for a door from an id.
   * @param id is the id of the door to search.
   * @return door found
   */
  public static Door findDoorById(String id) {
    for (Door door : allDoors) {
      if (door.getId().equals(id)) {
        logger.info("Doors with id " + id + " found.");
        return door;
      }
    }
    logger.warn("door with id " + id + " not found");
    return null; // otherwise we get a Java error
  }

  public static List<Door> getAllDoors() {
    logger.info(allDoors.toString());
    return allDoors;
  }

}