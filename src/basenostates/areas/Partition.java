package basenostates.areas;

import basenostates.doorstates.Door;
import basenostates.visitor.Visitor;
import basenostates.visitor.VisitorFindAreaById;
import basenostates.visitor.VisitorGetDoorsGivingAccesToArea;
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
    logger.debug("List of Areas added to Partition " + this.id + ".");
  }

  public void setAreaToPartition(Area area) {
    allAreas.add(area);
    logger.debug("Area added to Partition " + this.id + ".");
  }

  /**
   * Get all doors that are in a Space recursively
   * @return doors List of doors that are in a zone of Partitions and Spaces
   */
  @Override
  public List<Door> getDoorsGivingAccessToArea() {
    List<Door> listDoors = new ArrayList<>();

    this.visit = new VisitorGetDoorsGivingAccesToArea();

    for (Area area : allAreas) {
      listDoors.addAll((List<Door>) area.accept(visit));
    }

    return listDoors;
  }

  /**
   * Get a Partition or Space recursively.
   * @param id as String
   * @return Area
   */
  @Override
  public Area findAreaById(String id) {
    this.visit = new VisitorFindAreaById();
    List<Area> areaFound = new ArrayList<>();

    for (Area area : allAreas) {
      area.setIdToSearch(id);
      areaFound.addAll((List<Area>) area.accept(visit));
    }

    for (Area subArea : areaFound) {
      if (subArea.getId().equals(subArea.getIdToSearch())) {
        return subArea;
      }
    }

    return this;
  }

  @Override
  public List<Area> getSpacesFromArea() {
    logger.debug("Return a list of Partitions and Spaces that belong to Area " + this.id + ".");
    return allAreas;
  }

  @Override
  public List<?> accept(Visitor visit) {
    return visit.visitPartition(this);
  }
}
