package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import basenostates.doorstates.Door;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class VisitorGetDoorsGivingAccesToArea implements Visitor {
  private static List<Door> listDoorsToArea = new ArrayList<>();
  static Logger logger = LoggerFactory.getLogger("Fita2");

  @Override
  public void visitPartition(Partition partition) {
    for (Area area : partition.getAllAreas()) {
      area.accept(new VisitorGetDoorsGivingAccesToArea());
    }
  }

  @Override
  public void visitSpace(Space space) {
    logger.debug("Found Space, adding Doors to list of DoorsGivingAccessToArea.");
    listDoorsToArea.addAll(space.getAllDoors());
  }

  public static void initListDoorsToArea() {
    listDoorsToArea = new ArrayList<>();
  }

  public static List<Door> getListDoorsToArea() {
    return listDoorsToArea;
  }

}
