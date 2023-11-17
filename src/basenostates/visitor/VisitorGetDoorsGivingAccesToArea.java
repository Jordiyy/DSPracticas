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
    if (area instanceof Space) {
      return area.getDoorsGivingAccessToArea();
    }
    if (area instanceof Partition) {
      return area.getSpacesFromArea();
    }
    return null;
  }

}
