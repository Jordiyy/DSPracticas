package basenostates.areas;

import basenostates.doorstates.Door;
import basenostates.visitor.Visitor;
import basenostates.visitor.VisitorFindAreaById;
import basenostates.visitor.VisitorGetDoorsGivingAccesToArea;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Class that defines Partition object.
 */
public class Partition extends Area {
  private final List<Area> allAreas; //List that contains Partitions or Spaces.
  static Logger logger = LoggerFactory.getLogger("Fita1");

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

  public List<Area> getAllAreas() {
    return allAreas;
  }

  @Override
  public List<Area> getSpacesFromArea() {
    logger.debug("Return a list of Partitions and Spaces that belong to Area " + this.id + ".");
    return allAreas;
  }

  @Override
  public void accept(Visitor visit) {
    visit.visitPartition(this);
  }
}
