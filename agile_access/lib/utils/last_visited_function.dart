import 'package:agile_access/data/door_tree.dart';

void controlLastVisited(Door door, int idx) {
  if (LastVisited.lastVisitedList.isEmpty) {
    LastVisited.lastVisitedList.add(door);
  } else if (LastVisited.lastVisitedList.length <= 5) {
    Door aux = LastVisited.lastVisitedList[0];
    LastVisited.lastVisitedList.insert(0, door);
    for (int i = 1; i < LastVisited.lastVisitedList.length - 1; i++) {
      aux = LastVisited.lastVisitedList[i + 1];
      LastVisited.lastVisitedList[i + 1] = aux;
    }
    if (LastVisited.lastVisitedList.length == 6) {
      LastVisited.lastVisitedList.removeLast();
    }
  }
}
