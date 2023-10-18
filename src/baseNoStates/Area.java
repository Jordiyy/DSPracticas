package baseNoStates;

import java.util.List;

/**
 * Clase abstracta para la creación de las distintas areas siguiendo el patrón Composite.
 */
public abstract class Area {
  protected String id;
  protected String descripcion;
  protected Partition partitionDad;

  //Constructor de la clase abstracta
  public Area(String id, String descripcion, Partition partitionDad) {
    this.id = id;
    this.descripcion = descripcion;
    this.partitionDad = partitionDad;
  }

  public String getId() {
    return id;
  }

  public abstract List<Door> getDoorsGivingAccess();

  public abstract Area findAreaById(String id);

  public abstract List<Area> getSpaces();
}
