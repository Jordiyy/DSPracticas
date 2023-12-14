import 'package:agile_access/data/door_tree.dart';
import 'package:flutter/material.dart';

void controlLastVisited(Tree doorTree, int idx) {
  if (LastVisited.lastVisitedList.isEmpty) {
    LastVisited.lastVisitedList.add(doorTree.root.children[idx]);
  } else if (LastVisited.lastVisitedList.length <= 5) {
    Door aux = LastVisited.lastVisitedList[0];
    LastVisited.lastVisitedList.insert(0, doorTree.root.children[idx]);
    for (int i = 1; i < LastVisited.lastVisitedList.length - 1; i++) {
      aux = LastVisited.lastVisitedList[i + 1];
      LastVisited.lastVisitedList[i + 1] = aux;
    }
    if (LastVisited.lastVisitedList.length == 6) {
      LastVisited.lastVisitedList.removeLast();
    }
  }
}
