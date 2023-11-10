package basenostates;

import java.text.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Main {
  static Logger logger = LoggerFactory.getLogger(Main.class);

  public static void main(String[] args) throws ParseException {
    DirectoryAreas.makeAreas();
    DirectoryUserGroups.makeUserGroups();

    logger.debug("\n\nWebserver thread creation.\n\n");
    new WebServer();
  }
}
