package basenostates.areas;

import basenostates.visitor.Visitor;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.json.JSONObject;
import org.json.JSONArray;


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

  @Override
  public List<Area> getSpacesFromArea() {
    logger.debug("Return a list of Partitions and Spaces that belong to Area " + this.id + ".");
    return allAreas;
  }

  @Override
  public void accept(Visitor visit) {
    visit.visitPartition(this);
  }

  public JSONObject toJson(int depth) {
    // for depth=1 only the root and children,
    // for recusive = all levels use Integer.MAX_VALUE
    JSONObject json = new JSONObject();
    json.put("class", "partition");
    json.put("id", id);
    JSONArray jsonAreas = new JSONArray();
    if (depth > 0) {
      for (Area a : allAreas) {
        jsonAreas.put(a.toJson(depth - 1));
      }
      json.put("areas", jsonAreas);
    }
    return json;
  }
}
