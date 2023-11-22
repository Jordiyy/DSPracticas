package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import basenostates.doorstates.Door;

import java.util.ArrayList;
import java.util.List;

public class VisitorGetDoorsGivingAccesToArea implements Visitor {
  private static List<Door> listDoorsToArea = new ArrayList<>();

  @Override
  public void visitPartition(Partition partition) {
    for (Area area : partition.getAllAreas()) {
      area.accept(new VisitorGetDoorsGivingAccesToArea());
    }
  }

  @Override
  public void visitSpace(Space space) {
    listDoorsToArea.addAll(space.getAllDoors());
  }

  public static void initListDoorsToArea() {
    listDoorsToArea = new ArrayList<>();
  }
  public static List<Door> getListDoorsToArea() {
    return listDoorsToArea;
  }

}
