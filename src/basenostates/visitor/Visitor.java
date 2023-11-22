package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import basenostates.doorstates.Door;
import java.util.List;

public interface Visitor {
  default void visitSpace(Space space) {}

  default void visitPartition(Partition partition) {}

}
