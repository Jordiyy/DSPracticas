package baseNoStates;

import java.util.ArrayList;
import java.util.List;

public class Partition extends Area{

  private List<Area> allAreas;

  public Partition(String id, String noName, Partition partitionDad) {
    super(id, noName, partitionDad);
    allAreas = new ArrayList<>();
  }

  public void setAllAreas(ArrayList<Area> areas) {
    allAreas.addAll(areas);
  }

  public void setArea(Area area) {
    allAreas.add(area);
  }

  @Override
  public List<Door> getDoorsGivingAccess() {
    List<Door> doors = new ArrayList<>();
    for (Area area : allAreas) {
      if (area instanceof Partition)
        doors.addAll(area.getDoorsGivingAccess());

      if (area instanceof Space) {
        Space space = (Space) area;
        doors.addAll(space.getAllDoors());
      }
    }
    return doors;
  }

  @Override
  Area findAreaById(String id) {
    if (this.getId().equals(id))
      return this;

    for (Area area : allAreas) {
      if (area.getId().equals(id))
        return area;

      Area subArea = area.findAreaById(id);
      if (subArea != null)
        return subArea;
    }

    return null;
  }

  @Override
  public Space[] getSpaces() {
    Space[] canBe = new Space[]{};
    canBe = (Space[]) allAreas.toArray();
    return canBe;
  }
}
