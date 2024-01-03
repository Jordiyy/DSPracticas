
import 'package:agile_access/data/door_tree.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agile_access/data/user_data.dart';

final DateFormat DATEFORMATTER = DateFormat('yyyy-MM-ddThh:mm');
const String BASE_URL = "http://10.0.2.2:8080";

Future<String> sendRequest(Uri uri) async {
  final response = await http.get(uri);
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

Future<Tree> getTreeRequest(String areaId) async {
  Uri uri = Uri.parse("$BASE_URL/get_children?$areaId");
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

Future<void> lockDoor(Door door) async {
  actionDoorRequest(door, ActionsDoor.lock);
}

Future<void> unlockDoor(Door door) async {
  actionDoorRequest(door, ActionsDoor.unlock);
}

Future<void> lockAllDoor(Area areaID) async {
  lockUnlockArea(areaID, ActionsDoor.lock);
}

Future<void> unlocAllkDoor(Area areaID) async {
  lockUnlockArea(areaID, ActionsDoor.unlock);
}

Future<void> openDoor(Door door) async {
  actionDoorRequest(door, ActionsDoor.open);
}

Future<void> closeDoor(Door door) async {
  actionDoorRequest(door, ActionsDoor.close);
}

Future<void> actionDoorRequest(Door door, String action) async {
  assert((action == 'lock') |
      (action == 'unlock') |
      (action == 'open') |
      (action == 'close'));
  String strNow = DATEFORMATTER.format(DateTime.now());
  print(strNow);
  Uri uri = Uri.parse("$BASE_URL/reader?credential=11343&action=$action"
      "&datetime=$strNow&doorId=${door.id}");

  final String responseBody = await sendRequest(uri);
  Map<String, dynamic> decoded = jsonDecode(responseBody);
  print('requests.dart : door ${door.id} is ${decoded['state']}');
}

Future<void> lockUnlockArea(Area area, String action) async {
  assert((action == 'lock') | (action == 'unlock'));
  String strNow = DATEFORMATTER.format(DateTime.now());
  print(strNow);
  Uri uri = Uri.parse("$BASE_URL/area?credential=11343&action=$action"
      "&datetime=$strNow&areaId=${area.id}");

  print('lock ${area.id}, uri $uri');
  final String responseBody = await sendRequest(uri);
  Map<String, dynamic> decoded = jsonDecode(responseBody);
  print('requests.dart : door ${area.id} is ${decoded['state']}');
}
