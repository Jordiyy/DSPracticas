package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import basenostates.doorstates.Door;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Visitor pattern class that implements that looks for
 * the doors that give access to a specific area.
 */
public class VisitorGetDoorsGivingAccesToArea implements Visitor {
  private static List<Door> listDoorsToArea = new ArrayList<>();
  static Logger logger = LoggerFactory.getLogger("Fita2");

  /**
   * Method that implements the Visit of a partition and all the areas within it.
   * @param partition The partition being visited.
   */
  @Override
  public void visitPartition(Partition partition) {
    for (Area area : partition.getSpacesFromArea()) {
      area.accept(new VisitorGetDoorsGivingAccesToArea());
    }
  }

  /**
   * Method that implements the Visit of a space to get the doors within it.
   * @param space The space being visited.
   */
  @Override
  public void visitSpace(Space space) {
    logger.debug("Found Space, adding Doors to list of DoorsGivingAccessToArea.");
    listDoorsToArea.addAll(space.getAllDoors());
  }

  /**
   * Method that implements the initialization of the list of doors that give access to area.
   */
  public static void initListDoorsToArea() {
    listDoorsToArea = new ArrayList<>();
  }

  public static List<Door> getListDoorsToArea() {
    return listDoorsToArea;
  }

}
