package baseNoStates;

public abstract class DoorState {
  protected Door door;
  protected String name;


  public DoorState(Door door){
    this.door = door;
    name = door.getId();
  }

  protected void open(){}
  protected void close(){}
  protected void lock(){}
  protected void unlocked(){}
}
