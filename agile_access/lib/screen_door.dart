import 'package:agile_access/data/door_tree.dart';
import 'package:agile_access/screen_home_partition.dart';
import 'package:agile_access/utils/nav_functions.dart';
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
  late Future<Tree> doorTree;
  int idxNavBar = 0;
  late int idxDoor;

  late List<String> iconList;

  late String stateDoor;

  late bool closedDoor;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    door = widget.door;
    doorTree = getTreeRequest(door.id);

    stateDoor = door.state == "unlocked" ? "Unlock" : "Lock";

    closedDoor = door.closed;

    iconList = [
      closedDoor == true ? Bi.door_open : Bi.door_closed,
      stateDoor == "Unlock"
          ? MaterialSymbols.lock_outline
          : MaterialSymbols.lock_open_outline,
      MaterialSymbols.lock_clock_outline
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: doorTree,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              bottomNavigationBar: NavBar(
                  ItemNavSelected: (index) =>
                      ItemNavSelected(context, index, userGroup, userData)).bar,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                title: Text("Door ${door.id}"),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${door.id} options"),
                  Text.rich(TextSpan(children: [
                    const TextSpan(text: "Estatus: "),
                    TextSpan(
                        text: stateDoor == "Unlock" ? "Unlocked" : "Locked",
                        style: TextStyle(
                            color: stateDoor == "Lock"
                                ? Colors.red
                                : Colors.green)),
                    TextSpan(text: " - "),
                    TextSpan(
                        text: closedDoor == false ? "Opened" : "Closed",
                        style: TextStyle(
                            color: closedDoor == true
                                ? Colors.red
                                : Colors.green)),
                  ])),
                  Row(
                    children: [
                      ElevatedButton(
                          child: Column(children: [
                            Iconify(iconList[0]),
                            Text(closedDoor == true ? "Open" : "Close")
                          ]),
                          onPressed: () async {
                            idxDoor = snapshot.data!.root.children
                                .indexWhere((d) => d.id == door.id);
                            snapshot.data!.root.children[idxDoor].closed ==
                                    false
                                ? closeDoor(door)
                                : openDoor(door);
                            setState(() {
                              if (snapshot
                                      .data!.root.children[idxDoor].closed ==
                                  false) {
                                iconList[0] = Bi.door_open;
                                closedDoor = true;
                              } else {
                                iconList[0] = Bi.door_closed;
                                closedDoor = false;
                              }
                              doorTree = getTreeRequest(door.id);
                            });
                            userData.history.add({
                              door.id:
                                  "${DateFormat('dd/MM/yyyy - HH:mm:ss').format(DateTime.now())}\n${userData.name} ${closedDoor}"
                            });
                          }),
                      ElevatedButton(
                          child: Column(children: [
                            Iconify(iconList[1]),
                            Text(stateDoor == "Unlock" ? "Lock" : "Unlock")
                          ]),
                          onPressed: () {
                            idxDoor = snapshot.data!.root.children
                                .indexWhere((d) => d.id == door.id);
                            snapshot.data!.root.children[idxDoor].state ==
                                    "unlocked"
                                ? lockDoor(door)
                                : unlockDoor(door);

                            setState(() {
                              if (snapshot.data!.root.children[idxDoor].state ==
                                  "unlocked") {
                                iconList[1] = MaterialSymbols.lock_open_outline;
                                stateDoor = "Lock";
                                //stateBoton = "Unlock";
                              } else {
                                iconList[1] = MaterialSymbols.lock_outline;
                                stateDoor = "Unlock";
                                //stateBoton = "Lock";
                              }
                              doorTree = getTreeRequest(door.id);
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
                              iconList[2] = iconList[2] ==
                                      MaterialSymbols.lock_clock_outline
                                  ? MaterialSymbols.lock_reset
                                  : MaterialSymbols.lock_clock_outline;
                            });
                          }),
                    ],
                  ),
                  const Text("History"),
                  Expanded(
                    child: userData.history.isEmpty
                        ? const Text("No data in history")
                        : ListView.builder(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: userData.history.length,
                            itemBuilder: (BuildContext context, int index) =>
                                _buildRow(userData.history[index], door.id),
                          ),
                  )
                ],
              ));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }

  Widget _buildRow(Map<String, String> info, String doorN) {
    String? name = info[doorN];

    if (name == null) {
      return const Text("No data in history");
    } else {
      return Card(child: Text(name));
    }
  }
}
