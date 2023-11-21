package basenostates.visitor;

import basenostates.areas.Area;
import java.util.ArrayList;
import java.util.List;

public class VisitorFindAreaById implements Visitor {

  @Override
  public List<?> visitPartition(Object obj) {
    List<Area> list = new ArrayList<>();
    Area area = (Area) obj;

    list.add(area.findAreaById(area.getIdToSearch()));
    return list;
  }

  @Override
  public List<?> visitSpace(Object obj) {
    List<Area> list = new ArrayList<>();
    Area area = (Area) obj;

    if (area.getId().equals(area.getIdToSearch())) {
      list.add(area.findAreaById(area.getIdToSearch()));
    }
    return list;
  }

}
