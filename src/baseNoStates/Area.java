package baseNoStates;

import java.util.ArrayList;
import java.util.List;

public abstract class Area {
  protected String id;
  protected String noName; //Que el profe diga que es
  protected Partition partitionDad;


  public Area(String id, String noName, Partition partitionDad) {
    this.id = id;
    this.noName = noName;
    this.partitionDad = partitionDad;
  }

  public String getId() {
    return id;
  }

  public abstract List<Door> getDoorsGivingAccess();

  abstract Area findAreaById(String id);

  public abstract Space[] getSpaces();
}
