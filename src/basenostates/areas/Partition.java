package basenostates.areas;

import basenostates.doorstates.Door;
import java.util.ArrayList;
import java.util.List;

/**
 * Class that defines Partition object.
 */
public class Partition extends Area {
  private final List<Area> allAreas; //List that contains Partitions or Spaces.

  public Partition(String id, String description, Partition partitionDad) {
    super(id, description, partitionDad);
    allAreas = new ArrayList<>();
  }

  public void setAllAreasToPartition(List<Area> areas) {
    allAreas.addAll(areas);

  }

  public void setAreaToPartition(Area area) {
    allAreas.add(area);
  }

  /**
   * Get all doors that are in a Space recursively
   * @return doors List of doors that are in a zone of Partitions and Spaces
   */
  @Override
  public List<Door> getDoorsGivingAccessToArea() {
    List<Door> doors = new ArrayList<>();
    for (Area area : allAreas) {
      if (area instanceof Partition) {
        doors.addAll(area.getDoorsGivingAccessToArea());
      }

      if (area instanceof Space) {
        Space space = (Space) area;
        doors.addAll(space.getAllDoorsFromSpace());
      }
    }

    return doors;
  }

  /**
   * Get a Partition or Space recursively.
   * @param id as String
   * @return Area
   */
  @Override
  public Area findAreaById(String id) {
    if (this.getId().equals(id)) {
      return this;
    }

    for (Area area : allAreas) {
      if (area.getId().equals(id)) {
        return area;
      }

      Area subArea = area.findAreaById(id);
      if (subArea != null) {
        return subArea;
      }
    }

    return null;
  }

  @Override
  public List<Area> getSpacesFromArea() {
    return allAreas;
  }
}
