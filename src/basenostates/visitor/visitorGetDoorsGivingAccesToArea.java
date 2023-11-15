package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import basenostates.doorstates.Door;

import java.util.ArrayList;
import java.util.List;

public class visitorGetDoorsGivingAccesToArea implements Visitor {
  @Override
  public List<Object> visitPartition(List<Area> allAreas) {
    List<Object> doors = new ArrayList<>();
    for (Area area : allAreas) {
      if (area instanceof Partition) {
        doors.addAll(area.getDoorsGivingAccessToArea());
      }

      if (area instanceof Space) {
        Space space = (Space) area;
        doors.addAll(space.getDoorsGivingAccessToArea());
      }
    }

    return doors;
  }
}
