package baseNoStates;

// Before executing enable assertions :
// https://se-education.org/guides/tutorials/intellijUsefulSettings.html

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;

public class Main {
  static Logger logger = LoggerFactory.getLogger(Main.class);

  private static void wait(int seconds){
    try{
      Thread.sleep(1000*seconds);
    } catch (InterruptedException e){
      e.printStackTrace();
    }
  }
  public static void main(String[] args) throws ParseException {

    DirectoryAreas.makeAreas();
    DirectoryUserGroups.makeUserGroups();

    logger.info("\n\nTesting LOGGER\n\n");
    new WebServer();
  }
}
