package baseNoStates;

import java.util.ArrayList;

public abstract class Area {
  protected String id;
  protected String noName; //Que el profe diga que es
  protected Partition partitionDad;


  public Area(String id, String noName, Partition partitionDad) {
    this.id = id;
    this.noName = noName;
    this.partitionDad = partitionDad;
  }

  public String getId() { return id; }

  abstract Door getDoorsGivingAccess();

  abstract Area findAreaById(String id);

  abstract ArrayList<?> getSpaces();

}
