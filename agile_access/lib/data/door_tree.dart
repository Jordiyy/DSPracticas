import 'package:flutter/material.dart';

abstract class Area {
  late String id;
  late List<dynamic> children;
  Area(this.id, this.children);
}

class Partition extends Area {
  Partition(String id, List<Area> children) : super(id, children);
}

class Space extends Area {
  Space(String id, List<Door> children) : super(id, children);
}

class Door {
  late String id;
  late bool closed;
  late String state;
  Door({required this.id, this.state = "unlocked", this.closed = true});
}

// at the moment this class seems unnecessary but later we will extend it
class Tree {
  late Area root;

  Tree(this.root);
}

Tree getTree(String id) {
  final List<Door> doors = List<Door>.of([
    Door(id: "D1", closed: true, state: "unlocked"),
    Door(id: "D2", closed: true, state: "unlocked"),
    Door(id: "D3", closed: true, state: "unlocked"),
    Door(id: "D4", closed: true, state: "unlocked"),
    Door(id: "D5", closed: true, state: "unlocked"),
    Door(id: "D6", closed: true, state: "unlocked"),
    Door(id: "D7", closed: true, state: "unlocked"),
    Door(id: "D8", closed: true, state: "unlocked"),
    Door(id: "D9", closed: true, state: "unlocked")
  ]);

  Map<String, Area> areas = {};
  areas["parking"] = Space("parking", List<Door>.of([doors[0], doors[1]]));
  areas["room1"] = Space("room1", List<Door>.of([doors[4]]));
  areas["room2"] = Space("room2", List<Door>.of([doors[5]]));
  areas["hall"] = Space("hall", List<Door>.of([doors[2], doors[3]]));
  areas["room3"] = Space("room3", List<Door>.of([doors[7]]));
  areas["it"] = Space("it", List<Door>.of([doors[8]]));
  areas["corridor"] = Space("corridor", List<Door>.of([doors[6]]));
  areas["basement"] = Partition("basement", List<Area>.of([areas["parking"]!]));
  areas["ground_floor"] = Partition("ground_floor",
      List<Area>.of([areas["room1"]!, areas["room2"]!, areas["hall"]!]));
  areas["floor1"] = Partition("floor1",
      List<Area>.of([areas["room3"]!, areas["it"]!, areas["corridor"]!]));
  areas["building"] = Partition(
      "building",
      List<Area>.of(
          [areas["basement"]!, areas["ground_floor"]!, areas["floor1"]!]));

  return Tree(areas[id]!);
}

class LastVisited {
  static List<Door> lastVisitedList = [];
}
