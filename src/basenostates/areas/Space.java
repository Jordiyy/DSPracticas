package basenostates.areas;

import basenostates.doorstates.Door;
import java.util.ArrayList;
import java.util.List;

/**
 * Class that defines Space object.
 */
public class Space extends Area {
  private final List<Door> allDoors; //List of doors that are in one Space.

  public Space(String id, String description, Partition partitionDad) {
    super(id, description, partitionDad);
    allDoors = new ArrayList<>();
  }

  public void setDoorsToSpace(ArrayList<Door> doors) {
    allDoors.addAll(doors);
  }

  public List<Door> getAllDoorsFromSpace() {
    return allDoors;
  }

  public void setOneDoorToSpace(Door door) {
    allDoors.add(door);
  }

  @Override
  public List<Door> getDoorsGivingAccessToArea() {
    return allDoors;
  }

  @Override
  public Area findAreaById(String id) {
    return null;
  }

  @Override
  public List<Area> getSpacesFromArea() {
    return null;
  }
}
