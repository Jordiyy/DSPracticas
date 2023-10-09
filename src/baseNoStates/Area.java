package baseNoStates;

import java.util.ArrayList;

public abstract class Area {
  private String id;
  private String noName; //Que el profe diga que es
  private Partition partitionDad;


  public Area(String id, String noName, Partition partitionDad) {
    this.id = id;
    this.noName = noName;
    this.partitionDad = partitionDad;
  }

  public String getId() { return id; }

  abstract Door getDoorGivingAccess();

  abstract Area findAreaById(String id);

  abstract ArrayList<?> getSpaces();




}
