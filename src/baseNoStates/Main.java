package baseNoStates;

// Before executing enable assertions :
// https://se-education.org/guides/tutorials/intellijUsefulSettings.html

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {
  static Logger logger = LoggerFactory.getLogger(Main.class);
  public static void main(String[] args) {
    DirectoryDoors.makeDoors();
    DirectoryUsers.makeUsers();
    DirectoryAreas.makeAreas();
    logger.info("\n\nTesting LOGGER\n\n");
    new WebServer();
  }
}
