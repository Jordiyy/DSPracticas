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
    logger.debug("List of doors added to Space " + this.id + ".");
  }

  public void setOneDoorToSpace(Door door) {
    allDoors.add(door);
    logger.debug("Door added to Space " + this.id + ".");
  }

  @Override
  public List<Door> getDoorsGivingAccessToArea() {
    logger.debug("Return a list of all doors of Space " + this.id + ".");
    return allDoors;
  }

  @Override
  public Area findAreaById(String id) {
    logger.warn("Cannot search into Space because is an endpoint of the tree.");
    return null;
  }

  @Override
  public List<Area> getSpacesFromArea() {
    logger.warn("Doesn't exist a list of Partitions or Spaces.");
    return null;
  }
}
