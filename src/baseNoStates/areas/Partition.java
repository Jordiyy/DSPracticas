package baseNoStates.areas;

import baseNoStates.doorstates.Door;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase que actua como de contenedor del patrón Composite, almacenando una lista de objetos de tipo Area.
 */
public class Partition extends Area{
  //Variable que almacena las areas de la que está formada dicha Area.
  private List<Area> allAreas;

  //Constructor de la clase Partition
  public Partition(String id, String descripcion, Partition partitionDad) {
    super(id, descripcion, partitionDad);
    allAreas = new ArrayList<>();
  }

  public void setAllAreas(ArrayList<Area> areas) {
    allAreas.addAll(areas);
  }

  public void setArea(Area area) {
    allAreas.add(area);
  }

  //Devuelve una lista de puertas a las que tiene permiso realizar acciones.
  @Override
  public List<Door> getDoorsGivingAccess() {
    List<Door> doors = new ArrayList<>();
    for (Area area : allAreas) {
      if (area instanceof Partition)
        doors.addAll(area.getDoorsGivingAccess());

      if (area instanceof Space) {
        Space space = (Space) area;
        doors.addAll(space.getAllDoors());
      }
    }
    return doors;
  }

  //Realiza una búsqueda recursiva para encontrar el Area buscada a través del arbol.
  @Override
  public Area findAreaById(String id) {
    if (this.getId().equals(id))
      return this;

    for (Area area : allAreas) {
      if (area.getId().equals(id))
        return area;

      Area subArea = area.findAreaById(id);
      if (subArea != null)
        return subArea;
    }

    return null;
  }

  //Devuelve todos las areas que se enceuntran a partir de su nodo/area
  @Override
  public Space[] getSpaces() {
    return (Space[]) allAreas.toArray();
  }
}
