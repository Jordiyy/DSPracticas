package baseNoStates.areas;

import baseNoStates.doorstates.Door;
import java.util.List;

public abstract class Area {
  protected String id;
  protected String descripcion;
  protected Partition partitionDad;


  public Area(String id, String descripcion, Partition partitionDad) {
    this.id = id;
    this.descripcion = descripcion;
    this.partitionDad = partitionDad;
  }

  public String getId() {
    return id;
  }

  public abstract List<Door> getDoorsGivingAccess();

  public abstract Area findAreaById(String id);

  public abstract List<Area> getSpaces();
}
