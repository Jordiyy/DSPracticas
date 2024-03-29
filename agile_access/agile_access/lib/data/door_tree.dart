const int periodeRefresh = 6;

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

  Tree(Map<String, dynamic> dec) {
    if (dec['class'] == "partition") {
      List<Area> children = <Area>[];
      if (dec['areas'] != null) {
        for (Map<String, dynamic> area in dec['areas']) {
          if (area['class'] == "partition" || area['class'] == "space") {
            children.add(Tree(area).root);
          } else {
            assert(false);
          }
        }
        root = Partition(dec['id'], children);
      }
    } else if (dec['class'] == "space") {
      List<Door> children = <Door>[];
      for (Map<String, dynamic> d in dec['access_doors']) {
        children.add(Door(id: d['id'], state: d['state'], closed: d['closed']));
      }
      root = Space(dec['id'], children);
    } else {
      assert(false);
    }
  }
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

  return Tree(areas);
}

class LastVisited {
  static List<Door> lastVisitedList = [];
}
