package basenostates.visitor;

import basenostates.areas.Area;
import basenostates.areas.Partition;
import basenostates.areas.Space;
import basenostates.doorstates.Door;
import java.util.List;

/**
 * Interface used by the visitor pattern to move logic from one class to an external class.
 * For each method a different class is created.
 * The same object that calls the visitor knows its class and
 * is redirected to the visit it belongs to.
 * The classes to call the visitor are done through an accept (Visitor visit).
 */
public interface Visitor {
  default void visitSpace(Space space) {}

  default void visitPartition(Partition partition) {}

}
