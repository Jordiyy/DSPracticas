package baseNoStates.areas;

import baseNoStates.Door;

public abstract class Area {
  /**
   * La idea de mi planteamiento es la siguiente:
   * - areaID es nombre del nodo actual
   * - children es el arbol que hay en los niveles inferiores
   * - fatherNode es para indicar el nodo del padre y se usara para acceder al nodo padre para añadir el contenido de tu nodo a su array children
   */
  protected String areaId;
  protected String description;
  protected Partition fatherNode;

  public Area(String areaName, String infoArea, Partition fromNode) {
    areaId = areaName;
    description = infoArea;
    fatherNode = fromNode;
  }

  public Door[] getDoorsGivingAccess() {
    /*
    * Recorrer el arbol buscando las puertas que tiene para añadirlas a una lista nueva y es la que devuelve.
    *
    *
    * FALTA HACERLO, pero mas adelante.
    *
    *
    * */

    /**OPCION 1
     * Funciona pero no lo hace de forma automatizada, no se como hacerlo
     *
     * Con la busqueda de las puertas en el arbol no haria falta hacer los new Door.
     *
     * Door d1 = new Door("d1");
     * Door d2 = new Door("d2");
     * Door[] toAdd = new Door[]{d1,d2};
     */

    /**OPCION 2 - IDEA de como seria
     *
     * Recorres arbol y obtienes las puertas en una lista
     * lista.lenght para saber cantidad de puertas
     * Door[] doors = new Door[lista.length]
     * for(i=0;i<lista-length;i++)
     *  doors[i] = puerta de la lista
     *
     *  return doors
     *
     */

    /*
    ArrayList<Door> doorsToAdd = null;
    doorsToAdd.add(new Door("D1"));
    Door[] doorsWithAccess = new ArrayList<>(Arrays.asList(doorsToAdd));
    */

    return null;
  }

  public String getAreaBuilding() {
    return areaId;
  }
}
