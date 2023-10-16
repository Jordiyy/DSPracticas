package baseNoStates.areas;

import baseNoStates.doorstates.Door;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase que actua como de hoja del patrón Composite.
 */
public class Space extends Area {
  //Lista de puertas que hay disponibles en su area.
  private List<Door> allDoors;

  //Constructor de la clase Space.
  public Space(String id, String descripcion, Partition partitionDad) {
    super(id, descripcion, partitionDad);
    allDoors = new ArrayList<>();
  }

  public void setDoors(ArrayList<Door> doors) {
    allDoors.addAll(doors);
  }

  public List<Door> getAllDoors() {
    return allDoors;
  }

  public void setOneDoor(Door door) {
    allDoors.add(door);
  }

  //Devuelve la lista de puertas que se enceuntran en el area
  @Override
  public List<Door> getDoorsGivingAccess() {
    return allDoors;
  }

  @Override
  public Area findAreaById(String id) {
    return null;
  }

  @Override
  public Space[] getSpaces() {
    return null;
  }
}
