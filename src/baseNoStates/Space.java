package baseNoStates;

import java.util.ArrayList;
import java.util.List;

public class Space extends Area {

  private List<Door> allDoors;

  public Space(String id, String noName, Partition partitionDad) {
    super(id, noName, partitionDad);
    allDoors = new ArrayList<>();
  }

  public void setDoors(ArrayList<Door> doors) { allDoors.addAll(doors); }

  public List<Door> getAllDoors() { return allDoors; }

  public void setOneDoor(Door door) {
    allDoors.add(door);
  }
  @Override
  public List<Door> getDoorsGivingAccess() { return allDoors; }

  @Override
  Area findAreaById(String id) {
    return null;
  }

  @Override
  public Space[] getSpaces() { return null; }
}
