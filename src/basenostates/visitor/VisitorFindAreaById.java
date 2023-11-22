package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;

import java.util.ArrayList;
import java.util.List;

public class VisitorFindAreaById implements Visitor {

  private static Area foundArea = null;

  @Override
  public void visitPartition(Partition partition) {
    if (partition.getId().equals(partition.getIdToSearch())) {
      foundArea = partition;
    } else {
      for (Area area : partition.getAllAreas()) {
        area.setIdToSearch(partition.getIdToSearch());
        area.accept(new VisitorFindAreaById());
      }
    }
  }

  @Override
  public void visitSpace(Space space) {
    if (space.getId().equals(space.getIdToSearch())) {
      foundArea = space;
    }
  }

  public static Area getFoundArea() {
    return foundArea;
  }

}
