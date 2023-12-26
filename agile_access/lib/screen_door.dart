import 'package:agile_access/data/door_tree.dart';
import 'package:agile_access/main.dart';
import 'package:agile_access/screen_home_partition.dart';
import 'package:agile_access/utils/nav_bar_functions.dart';
import 'package:agile_access/utils/requests_function.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:intl/intl.dart';

import 'package:agile_access/data/user_data.dart';
import 'package:agile_access/data/user_data.dart';
import 'nav_bar.dart';

class ScreenDoor extends StatefulWidget {
  UserGroup userGroup;
  User userData;
  Door door;

  ScreenDoor(
      {super.key,
      required this.userGroup,
      required this.userData,
      required this.door});

  @override
  State<ScreenDoor> createState() => _ScreenDoor();
}

class _ScreenDoor extends State<ScreenDoor> {
  late UserGroup userGroup;
  late User userData;
  late Door door;
  int idxNavBar = 0;

  List<String> iconList = [
    Bi.door_open,
    MaterialSymbols.lock_outline,
    MaterialSymbols.lock_clock_outline
  ];

  late String stateDoor;
  late String stateBoton;

  String closedDoor = "Open";
  String closedBoton = "Open";

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    door = widget.door;
    stateDoor = door.state;
    stateBoton = door.state == "unlocked" ? "Lock" : "Unlock";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavBar(
            ItemNavSelected: (index) =>
                ItemNavSelected(context, index, userGroup, userData)).bar,
        appBar: AppBar(
          backgroundColor: AgileAccessColors.azul3,
          foregroundColor: AgileAccessColors.text,
          title: Text("Door ${door.id}"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${door.id} options"),
            Text.rich(TextSpan(children: [
              const TextSpan(text: "Estatus: "),
              TextSpan(
                  text: "${stateDoor}",
                  style: TextStyle(
                      color:
                          stateDoor == "locked" ? Colors.red : Colors.green)),
              TextSpan(text: " - "),
              TextSpan(text: "Closed"),
            ])),
            Row(
              children: [
                ElevatedButton(
                    child: Column(
                        children: [Iconify(iconList[0]), Text(closedBoton)]),
                    onPressed: () async {
                      /* door.state == "unlocked"
                          ? await openDoor(door)
                          : await closeDoor(door);*/
                      setState(() {
                        if (door.closed == false) {
                          iconList[1] = Bi.door_open;
                          closedDoor = "Open door";
                          closedBoton = "Close door";
                        } else {
                          iconList[1] = Bi.door_closed;
                          closedDoor = "Close door";
                          closedBoton = "ClCloseose door";
                        }
                      });
                      userData.history.add({
                        door.id:
                            "${DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.now())}\n${userData.name} ${closedDoor}"
                      });
                    }),
                ElevatedButton(
                    child: Column(
                        children: [Iconify(iconList[1]), Text(stateBoton)]),
                    onPressed: () {
                      door.state == "unlocked"
                          ? lockDoor(door)
                          : unlockDoor(door);

                      setState(() {
                        if (door.state == "unlocked") {
                          iconList[1] = MaterialSymbols.lock_open_outline;
                          stateDoor = "locked";
                          stateBoton = "Unlock";
                        } else {
                          iconList[1] = MaterialSymbols.lock_outline;
                          stateDoor = "Unlock";
                          stateBoton = "Lock";
                        }
                      });
                      userData.history.insert(0, {
                        door.id:
                            "${DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.now())}\n${userData.name} $stateDoor door"
                      });
                    }),
                ElevatedButton(
                    child: Column(children: [
                      Iconify(iconList[2]),
                      const Text("Unlocked\nShortly")
                    ]),
                    onPressed: () {
                      userData.history.add({
                        door.id:
                            "${DateFormat('dd/MM/yyyy').format(DateTime.now())}\n $userData.name blocked the door."
                      });
                      setState(() {
                        iconList[2] =
                            iconList[2] == MaterialSymbols.lock_clock_outline
                                ? MaterialSymbols.lock_reset
                                : MaterialSymbols.lock_clock_outline;
                      });
                    }),
              ],
            ),
            Text("History"),
            Expanded(
              child: userData.history.isEmpty
                  ? Text("No data in history")
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: userData.history.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildRow(userData.history[index], door.id),
                    ),
            )
          ],
        ));
  }

  Widget _buildRow(Map<String, String> info, String doorN) {
    String? name = info[doorN];

    if (name == null) {
      return Text("No data in history");
    } else {
      return Card(child: Text(name));
    }
  }
}
