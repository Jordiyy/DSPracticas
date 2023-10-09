package baseNoStates;

import java.util.ArrayList;

public class Space extends Area {

  private ArrayList<Door> allDoors;

  public Space(String id, String noName, Partition partitionDad) {
    super(id, noName, partitionDad);
  }

  public void setDoors(ArrayList<Door> doors) { allDoors.addAll(doors); }
  @Override
  Door getDoorGivingAccess() {
    return null;
  }

  @Override
  Area findAreaById(String id) {
    return null;
  }

  @Override
  ArrayList<Door> getSpaces() {
    return allDoors;
  }
}
