package baseNoStates.areas;
import baseNoStates.doorstates.Door;

import java.util.ArrayList;
import java.util.List;

public class Space extends Area {
  private List<Door> allDoors;
  public Space(String id, String description, Partition partitionDad) {
    super(id, description, partitionDad);
    allDoors = new ArrayList<>();
  }

  public void setDoors(ArrayList<Door> doors) { allDoors.addAll(doors); }

  public List<Door> getAllDoors() { return allDoors; }

  public void setOneDoor(Door door) {
    allDoors.add(door);
  }
  @Override
  public List<Door> getDoorsGivingAccess() { return allDoors; }

  @Override
  public Area findAreaById(String id) {
    return null;
  }

  @Override
  public List<Area> getSpaces() { return null; }
}
