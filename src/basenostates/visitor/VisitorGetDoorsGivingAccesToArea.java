package basenostates.visitor;

import basenostates.areas.Area;
import java.util.List;

public class VisitorGetDoorsGivingAccesToArea implements Visitor {

  @Override
  public List<?> visitPartition(Object obj) {
    Area area = (Area) obj;
    return area.getDoorsGivingAccessToArea();
  }

  @Override
  public List<?> visitSpace(Object obj) {
    Area area = (Area) obj;
    return area.getDoorsGivingAccessToArea();
  }

}
