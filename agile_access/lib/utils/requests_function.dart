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

Future<void> lockAllDoor(Area areaID) async {
  lockUnlockArea(areaID, ActionsDoor.lock);
}

Future<void> unlocAllkDoor(Area areaID) async {
  lockUnlockArea(areaID, ActionsDoor.unlock);
}

Future<void> lockUnlockDoor(Door door, String action) async {
  assert((action == 'lock') | (action == 'unlock'));
  String strNow = DATEFORMATTER.format(DateTime.now());
  print(strNow);
  Uri uri = Uri.parse("${BASE_URL}/reader?credential=11343&action=$action"
      "&datetime=$strNow&doorId=${door.id}");

  final String responseBody = await sendRequest(uri);
  Map<String, dynamic> decoded = jsonDecode(responseBody);
  print('requests.dart : door ${door.id} is ${decoded['state']}');
}

// TODO: las credenciales
Future<void> lockUnlockArea(Area area, String action) async {
  assert((action == 'lock') | (action == 'unlock'));
  String strNow = DATEFORMATTER.format(DateTime.now());
  print(strNow);
  Uri uri = Uri.parse("${BASE_URL}/area?credential=11343&action=$action"
      "&datetime=$strNow&areaId=${area.id}");

  print('lock ${area.id}, uri $uri');
  final String responseBody = await sendRequest(uri);
  Map<String, dynamic> decoded = jsonDecode(responseBody);
  print('requests.dart : door ${area.id} is ${decoded['state']}');
}

Future<Tree> getTreeQuery(String areaId) async {
  Uri uri = Uri.parse("${BASE_URL}/get_children?$areaId");
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    print("statusCode=$response.statusCode");
    print(response.body);
    Map<String, dynamic> decoded = json.decode(response.body);
    return Tree(decoded);
  } else {
    print("statusCode=$response.statusCode");
    throw Exception('failed to get answer to request $uri');
  }
}
