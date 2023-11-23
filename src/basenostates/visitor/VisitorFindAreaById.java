package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Visitor pattern class that implements the search for the existence of Areas.
 * The Method that implements the visit of a partition within the area tree.
 */
public class VisitorFindAreaById implements Visitor {
  private static Area foundArea = null;
  static Logger logger = LoggerFactory.getLogger("Fita2");

  /**
   * Method that implements the visit of a partition within the area tree.
   * @param partition The partition being visited.
   */
  @Override
  public void visitPartition(Partition partition) {
    if (partition.getId().equals(partition.getIdToSearch())) {
      logger.debug("Area found.");
      foundArea = partition;
    } else {
      for (Area area : partition.getSpacesFromArea()) {
        area.setIdToSearch(partition.getIdToSearch());
        area.accept(new VisitorFindAreaById());
      }
    }
  }

  /**
   * Method that implements the visit of a space within the area tree.
   * @param space The space being visited.
   */
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
