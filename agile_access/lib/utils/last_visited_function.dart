import 'package:agile_access/data/door_tree.dart';
import 'package:flutter/material.dart';

void controlLastVisited(Door door) {
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

List<Door> LastVisitedControl(List<Door> lastVisited, Door door) {
  if (lastVisited.isEmpty) {
    lastVisited.add(door);
  } else {
    lastVisited.insert(0, door);

    if (lastVisited.length == 6) {
      lastVisited.removeLast();
    }
  }

  return lastVisited;
}
