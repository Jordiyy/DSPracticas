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
    Area a1 = new Building("building");
    Area a2 = new Basement("basement");
    Area a3 = new Parking("parking");
    Area a4 = new GroundFloor("ground_floor");
    Area a5 = new GroundFloor("hall");
    Area a6 = new GroundFloor("room1");
    Area a7 = new GroundFloor("room2");
    Area a8 = new Floor1("floor1");
    Area a9 = new Floor1("room3");
    Area a10 = new Floor1("corridor");
    Area a11 = new Floor1("IT");
    Area a12 = new Stairs("stairs");
    Area a13 = new Exterior("exterior");

    allAreas = new ArrayList<>(Arrays.asList(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13));

        /*
        * new Area("building", 3,347,91,380),
            new Area("exterior", 617,352,706,379),
            new Area("basement", 138,9,250,38),
            new Area("parking", 86,175,174,205),
            new Area("ground_floor", 559,9,696,38),
            new Area("room1", 491,175,574,197),
            new Area("room2", 678,72,763,99),
            new Area("hall", 706,259,755,286),
            new Area("floor1", 1018,9,1097,38),
            new Area("corridor", 1093,200,1126,291),
            new Area("room3", 922,171,1004,198),
            new Area("IT", 1190,86,1226,115)
        ];
        var stairs = new Area("stairs", 306,179,370,203);*/
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
