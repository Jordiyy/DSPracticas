package basenostates.areas;

import basenostates.doorstates.Door;
import basenostates.visitor.Visitor;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Class that defines Space object.
 */
public class Space extends Area {
  private final List<Door> allDoors; //List of doors that are in one Space.
  static Logger logger = LoggerFactory.getLogger("Fita1");

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
  public List<Area> getSpacesFromArea() {
    logger.warn("Doesn't exist a list of Partitions or Spaces.");
    return null;
  }

  public List<Door> getAllDoors() {
    return allDoors;
  }

  public void accept(Visitor visit) {
    visit.visitSpace(this);
  }
}
