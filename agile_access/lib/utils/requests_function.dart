import 'dart:collection';

import 'package:agile_access/data/door_tree.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agile_access/data/user_data.dart';

final DateFormat DATEFORMATTER = DateFormat('yyyy-MM-ddThh:mm');
const String BASE_URL = "http://10.0.2.2:8080";

Future<String> sendRequest(Uri uri) async {
  final response = await http.get(uri);
// response is NOT a Future because of await
  if (response.statusCode == 200) {
    // server returns an OK response
    print("statusCode=$response.statusCode");
    print(response.body);
    return response.body;
  } else {
    print("statusCode=$response.statusCode");
    throw Exception('failed to get answer to request $uri');
  }
}

Future<Tree> getNewTree(Area area, String action) async {
  String strNow = DATEFORMATTER.format(DateTime.now());
  Uri uri = Uri.parse("${BASE_URL}/area?credential=11343&action=$action"
      "&datetime=$strNow&areaId=${area.id}");
  final String responseBody = await sendRequest(uri);
  Map<String, dynamic> decoded = jsonDecode(responseBody);

  Area newArea = area is Partition
      ? Partition(area.id, area.children.cast<Area>())
      : Space(area.id, area.children.cast<Door>());

  newArea = updatePartition(newArea, decoded["requestsDoors"]);

  return Tree(newArea);
}

Area updatePartition(Area area, List<dynamic> doors) {
  List<Map<String, dynamic>> delElement = [];
  for (Area a in area.children) {
    if (doors.isEmpty) {
      break;
    } else if (a is Space) {
      for (Door door in a.children) {
        for (Map<String, dynamic> newDoors in doors) {
          if (door.id == newDoors["doorId"]) {
            door.state = newDoors["action"]!;
            delElement.add(newDoors);
          }
        }
      }
    } else {
      updatePartition(a, doors);
    }
  }
  doors.removeWhere((door) => delElement.contains(door));
  return area;
}

Future<void> lockDoor(Door door) async {
  lockUnlockDoor(door, ActionsDoor.lock);
}

Future<void> unlockDoor(Door door) async {
  lockUnlockDoor(door, ActionsDoor.unlock);
}

Future<Tree> lockAllDoor(Area areaID) async {
  return getNewTree(areaID, ActionsDoor.lock);
}

Future<Tree> unlocAllkDoor(Area areaID) async {
  return getNewTree(areaID, ActionsDoor.unlock);
}

Future<void> lockUnlockDoor(Door door, String action) async {
// From the simulator : when asking to lock door D1, of parking, the request is
// http://localhost:8080/reader?credential=11343&action=lock
// &datetime=2023-12-08T09:30&doorId=D1
  assert((action == 'lock') | (action == 'unlock'));
  String strNow = DATEFORMATTER.format(DateTime.now());
  print(strNow);
  Uri uri = Uri.parse("${BASE_URL}/reader?credential=11343&action=$action"
      "&datetime=$strNow&doorId=${door.id}");
// credential 11343 corresponds to user Ana of Administrator group
  print('lock ${door.id}, uri $uri');
  final String responseBody = await sendRequest(uri);
  Map<String, dynamic> decoded = jsonDecode(responseBody);
  door.state = decoded['state'];
  print('requests.dart : door ${door.id} is ${door.state}');
}
