import 'dart:async';

import 'package:agile_access/data/door_tree.dart';
import 'package:agile_access/screen_home_partition.dart';
import 'package:agile_access/utils/nav_functions.dart';
import 'package:agile_access/utils/requests_function.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:intl/intl.dart';
import 'package:agile_access/generated/l10n.dart';

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

  Timer _timer = Timer(Duration.zero, () {});

  final DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    door = widget.door;
    doorTree = getTreeRequest(door.id);

    _activateTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: doorTree,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          idxDoor =
              snapshot.data!.root.children.indexWhere((d) => d.id == door.id);

          if (snapshot.data!.root.children[idxDoor] is Door) {
            iconList = [
              snapshot.data!.root.children[idxDoor].closed == true
                  ? Bi.door_open
                  : Bi.door_closed,
              snapshot.data!.root.children[idxDoor].state == "unlocked"
                  ? MaterialSymbols.lock_outline
                  : MaterialSymbols.lock_open_outline,
              MaterialSymbols.lock_clock_outline
            ];
          }
          return Scaffold(
              bottomNavigationBar: NavBar(ItemNavSelected: (index) {
                _timer.cancel();
                ItemNavSelected(context, index, userGroup, userData);
              }).bar,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                title: Text(
                    "${S.of(context).doorID(snapshot.data!.root.children[idxDoor].id)}"),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${S.of(context).doorOptions(snapshot.data!.root.children[idxDoor].id)}"),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "${S.of(context).doorsStatus}: "),
                    TextSpan(
                        text: snapshot.data!.root.children[idxDoor].state ==
                                "unlocked"
                            ? "${S.of(context).unlocked}"
                            : "${S.of(context).locked}",
                        style: TextStyle(
                            color:
                                snapshot.data!.root.children[idxDoor].state ==
                                        "locked"
                                    ? Colors.red
                                    : Colors.green)),
                    const TextSpan(text: " - "),
                    TextSpan(
                        text:
                            snapshot.data!.root.children[idxDoor].closed == true
                                ? "${S.of(context).close}"
                                : "${S.of(context).open}",
                        style: TextStyle(
                            color:
                                snapshot.data!.root.children[idxDoor].closed ==
                                        true
                                    ? Colors.red
                                    : Colors.green)),
                  ])),
                  Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: snapshot.data!.root
                                          .children[idxDoor].closed ==
                                      false
                                  ? Colors.blue
                                  : Colors.white),
                          child: Column(children: [
                            Iconify(
                                snapshot.data!.root.children[idxDoor].closed ==
                                        false
                                    ? iconList[0] = Bi.door_closed
                                    : iconList[0] = Bi.door_open),
                            Text(snapshot.data!.root.children[idxDoor].closed ==
                                    true
                                ? "${S.of(context).close}"
                                : "${S.of(context).open}")
                          ]),
                          onPressed: () async {
                            snapshot.data!.root.children[idxDoor].closed ==
                                    false
                                ? closeDoor(
                                    snapshot.data!.root.children[idxDoor])
                                : openDoor(
                                    snapshot.data!.root.children[idxDoor]);
                            setState(() {
                              if (snapshot
                                      .data!.root.children[idxDoor].closed ==
                                  false) {
                                iconList[0] = Bi.door_closed;
                              } else {
                                iconList[0] = Bi.door_open;
                              }
                              doorTree = getTreeRequest(
                                  snapshot.data!.root.children[idxDoor].id);
                            });
                            userData.history.add({
                              snapshot.data!.root.children[idxDoor].id:
                                  "${S.of(context).dateTime(_now, _now)} \n${userData.name} ${snapshot.data!.root.children[idxDoor].closed == false ? "Open" : "Close"}"
                            });
                          }),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  snapshot.data!.root.children[idxDoor].state ==
                                          "locked"
                                      ? Colors.blue
                                      : Colors.white),
                          child: Column(children: [
                            Iconify(iconList[1]),
                            Text(snapshot.data!.root.children[idxDoor].state ==
                                    "unlocked"
                                ? "${S.of(context).unlocked}"
                                : "${S.of(context).locked}")
                          ]),
                          onPressed: () {
                            snapshot.data!.root.children[idxDoor].state ==
                                    "unlocked"
                                ? lockDoor(
                                    snapshot.data!.root.children[idxDoor])
                                : unlockDoor(
                                    snapshot.data!.root.children[idxDoor]);

                            setState(() {
                              if (snapshot.data!.root.children[idxDoor].state ==
                                  "unlocked") {
                                iconList[1] = MaterialSymbols.lock_open_outline;
                              } else {
                                iconList[1] = MaterialSymbols.lock_outline;
                              }
                              doorTree = getTreeRequest(
                                  snapshot.data!.root.children[idxDoor].id);
                            });
                            userData.history.insert(0, {
                              snapshot.data!.root.children[idxDoor].id:
                                  "${S.of(context).dateTime(_now, _now)}\n${userData.name} ${snapshot.data!.root.children[idxDoor].state} door"
                            });
                          }),
                      ElevatedButton(
                          child: Column(children: [
                            Iconify(iconList[2]),
                            const Text("Unlocked\nShortly")
                          ]),
                          onPressed: () {
                            userData.history.add({
                              snapshot.data!.root.children[idxDoor].id:
                                  "${S.of(context).dateTime(_now, _now)}\n $userData.name blocked the door."
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
                  Text(S.of(context).doorHistory),
                  Expanded(
                    child: userData.history
                            .where((item) => item.containsKey(door.id))
                            .isEmpty
                        ? Text(S.of(context).doorNoHistoryList)
                        : ListView.builder(
                            padding: const EdgeInsets.all(16.0),
                            itemCount: userData.history
                                .where((item) => item.containsKey(door.id))
                                .length,
                            itemBuilder: (BuildContext context, int index) {
                              final filterHistory = userData.history
                                  .where((item) => item.containsKey(door.id))
                                  .toList();
                              return _buildRow(filterHistory[index],
                                  snapshot.data!.root.children[idxDoor].id);
                            },
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
      return Text(S.of(context).doorNoHistoryList);
    } else {
      return Card(child: Text(name));
    }
  }

  void _activateTimer() {
    _timer = Timer.periodic(const Duration(seconds: periodeRefresh), (Timer t) {
      doorTree = getTreeRequest(door.id);
      setState(() {});
    });
  }
}
