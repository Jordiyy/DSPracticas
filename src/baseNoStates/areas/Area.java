package baseNoStates.areas;
import baseNoStates.doorstates.Door;
import java.util.List;

public abstract class Area {
  protected String id;
  protected String description;
  protected Partition partitionDad;

  public Area(String id, String description, Partition partitionDad) {
    this.id = id;
    this.description = description;
    this.partitionDad = partitionDad;
  }

  public String getId() {
    return id;
  }

  public abstract List<Door> getDoorsGivingAccess();

  public abstract Area findAreaById(String id);

  public abstract List<Area> getSpaces();
}
