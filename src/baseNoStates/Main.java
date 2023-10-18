package baseNoStates;

// Before executing enable assertions :
// https://se-education.org/guides/tutorials/intellijUsefulSettings.html

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;

public class Main {
  static Logger logger = LoggerFactory.getLogger(Main.class);
  public static void main(String[] args) throws ParseException {
    DirectoryDoors.makeDoors();
    DirectoryAreas.makeAreas();
    DirectoryUserGroups.makeUserGroups();

    logger.info("\n\nTesting LOGGER\n\n");
    new WebServer();
  }
}
