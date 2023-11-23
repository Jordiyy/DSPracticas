package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class VisitorFindAreaById implements Visitor {

  private static Area foundArea = null;
  static Logger logger = LoggerFactory.getLogger("Fita2");

  @Override
  public void visitPartition(Partition partition) {
    if (partition.getId().equals(partition.getIdToSearch())) {
      logger.debug("Area found.");
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
      logger.debug("Area found.");
      foundArea = space;
    }
  }

  public static Area getFoundArea() {
    return foundArea;
  }

}
