package baseNoStates.areas;
import baseNoStates.doorstates.Door;

import java.util.ArrayList;
import java.util.List;

public class Partition extends Area{
  private final List<Area> allAreas;

  public Partition(String id, String description, Partition partitionDad) {
    super(id, description, partitionDad);
    allAreas = new ArrayList<>();
  }

  public void setAllAreas(List<Area> areas) {
    allAreas.addAll(areas);
  }

  public void setArea(Area area) {
    allAreas.add(area);
  }

  @Override
  public List<Door> getDoorsGivingAccess() {
    List<Door> doors = new ArrayList<>();
    for (Area area : allAreas) {
      if (area instanceof Partition) {
        doors.addAll(area.getDoorsGivingAccess());
      }

      if (area instanceof Space) {
        Space space = (Space) area;
        doors.addAll(space.getAllDoors());
      }
    }

    return doors;
  }

  @Override
  public Area findAreaById(String id) {
    if (this.getId().equals(id)) { return this; }

    for (Area area : allAreas) {
      if (area.getId().equals(id)) { return area; }

      Area subArea = area.findAreaById(id);
      if (subArea != null){ return subArea; }
    }

    return null;
  }

  @Override
  public List<Area> getSpaces() { return allAreas; }
}
