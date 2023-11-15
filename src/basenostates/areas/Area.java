package basenostates.areas;

import basenostates.doorstates.Door;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * We use a Composite Design Patters because the structure of the different spaces follows the
 * principles of the composite pattern, which are a class with a list of objects of said class
 * and another class that contains the values.
 * Abstract class that defines a Partition (Node) or a Space (Leaf).
 * Partition contains a list of more Partitions or Spaces. While Space contains a list of Door
 * that are located in that Space.
 */
public abstract class Area {
  protected String id;
  protected String description;
  protected Partition partitionDad;
  static Logger logger = LoggerFactory.getLogger(Area.class);

  public Area(String id, String description, Partition partitionDad) {
    this.id = id;
    this.description = description;
    this.partitionDad = partitionDad;
  }

  public String getId() {
    return id;
  }

  public abstract List<Door> getDoorsGivingAccessToArea();

  public abstract Area findAreaById(String id);

  public abstract List<Area> getSpacesFromArea();
}