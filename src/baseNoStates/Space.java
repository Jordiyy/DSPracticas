package baseNoStates;

import java.util.ArrayList;

public class Space extends Area {

  private ArrayList<Door> allDoors;

  public Space(String id, String noName, Partition partitionDad) {
    super(id, noName, partitionDad);
    allDoors = new ArrayList<>();
  }

  public void setDoors(ArrayList<Door> doors) { allDoors.addAll(doors); }

  public void setOneDoor(Door door) {
    allDoors.add(door);
  }
  @Override
  Door getDoorsGivingAccess() {
    return allDoors.get(0);
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
