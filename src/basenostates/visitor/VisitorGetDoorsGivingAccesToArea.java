package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class VisitorGetDoorsGivingAccesToArea implements Visitor {

  @Override
  public List<?> visitPartition(Area area) {
    return area.getDoorsGivingAccessToArea();
  }

  @Override
  public List<?> visitSpace(Area area) {
    return area.getDoorsGivingAccessToArea();
  }

}
