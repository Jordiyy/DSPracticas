package baseNoStates;

import java.util.ArrayList;
import java.util.Arrays;

public class Partition extends Area{

  private ArrayList<Area> allAreas;
  public Partition(String id, String noName, Partition partitionDad){
    super(id, noName, partitionDad);
    allAreas = new ArrayList<>();
  }
  public void setAllAreas(ArrayList<Area> areas) { allAreas.addAll(areas); }
  public void setArea(Area area) { allAreas.add(area); }


  @Override
  Door getDoorsGivingAccess() {
    return null;
  }

  @Override
  Area findAreaById(String id) {
    Area trobada = null;
    for (Area area : allAreas) {
      if (trobada == null) {
        if (area.getId().equals(id)) {
          return area;
        }
        else {
          trobada = area.findAreaById(id);
        }
      }

    }
    return trobada;
  }
  @Override
  ArrayList<Area> getSpaces() { return allAreas; }
}
