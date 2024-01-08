import 'package:agile_access/data/door_tree.dart';
import 'package:flutter/material.dart';

List<int> countEstateDoorDoor(Area area) {
  int locked = 0;
  int unlocked = 0;
  int closed = 0;
  int opened = 0;

  for (var a in area.children) {
    if (a is Partition || a is Space) {
      List<int> result = countEstateDoorDoor(a);
      unlocked += result[0];
      locked += result[1];
      closed += result[2];
      opened += result[3];
    } else {
      if (a.state == "unlocked") {
        unlocked++;
      } else {
        locked++;
      }
      if (a.closed == true) {
        closed++;
      } else {
        opened++;
      }
    }
  }

  return [unlocked, locked, closed, opened];
}
