package baseNoStates;

import java.util.ArrayList;
import java.util.Arrays;

public class Partition extends Area{

  private ArrayList<Area> allAreas;

  public void setAllAreas(ArrayList<Area> doors) { allAreas.addAll(doors); }
  public void setArea(Area area) { allAreas.add(area); }
  public Partition(String id, String noName, Partition partitionDad){
    super(id, noName, partitionDad);
  }

  @Override
  Door getDoorGivingAccess() {
    return null;
  }

  @Override
  Area findAreaById(String id) {
    for(Area area : allAreas)
      if(area.getId().equals(id))
        return area;

    return null;
  }
  @Override
  ArrayList<Area> getSpaces() { return allAreas; }
}
