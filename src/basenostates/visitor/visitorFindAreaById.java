package basenostates.visitor;

import basenostates.areas.Area;

import java.util.List;

public class visitorFindAreaById implements Visitor {
  @Override
  public List<Object> visitPartition(List<Area> allAreas) {
    if (this.getId().equals(id)) {
      return this;
    }

    for (Area area : allAreas) {
      if (area.getId().equals(id)) {
        return area;
      }

      Area subArea = area.findAreaById(id);
      if (subArea != null) {
        return subArea;
      }
    }

    return null;
  }
}
