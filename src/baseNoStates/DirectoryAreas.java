package baseNoStates;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class DirectoryAreas {
  private static List<Door> allDoors;
  private static Area rootArea;

  public static void makeAreas(){
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
    Space IT = new Space("IT", "...", floor1);
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
    Door d9 = new Door("D9", corridor, IT);

    parking.setDoors(new ArrayList<>(Arrays.asList(d1, d2)));
    hall.setDoors(new ArrayList<>(Arrays.asList(d3, d4)));
    room1.setOneDoor(d5);
    room2.setOneDoor(d6);
    room3.setOneDoor(d8);
    corridor.setOneDoor(d7);
    IT.setOneDoor(d9);

    basement.setArea(parking);
    groundFloor.setAllAreas(new ArrayList<>(Arrays.asList(hall, room1, room2)));
    floor1.setAllAreas(new ArrayList<>(Arrays.asList(room3, corridor, IT)));

    building.setAllAreas(new ArrayList<>(Arrays.asList(basement, groundFloor, floor1, stairs, exterior)));

    rootArea = building;
  }

  public static Area findAreaById(String areaId) {
    return rootArea.findAreaById(areaId);
  }
}