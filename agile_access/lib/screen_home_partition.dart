import 'dart:async';
import 'package:agile_access/utils/door_functions.dart';
import 'package:agile_access/utils/nav_functions.dart';
import 'package:agile_access/utils/alert_helper_fuctions.dart';
import 'package:agile_access/utils/requests_function.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

import 'nav_bar.dart';
import 'package:agile_access/data/user_data.dart';
import 'screen_space.dart';

import 'data/door_tree.dart';

class ScreenHomePartition extends StatefulWidget {
  UserGroup userGroup;
  User userData;
  String areaName;

  ScreenHomePartition(
      {super.key,
      required this.userGroup,
      required this.userData,
      required this.areaName});

  @override
  State<ScreenHomePartition> createState() => _ScreenHomePartition();
}

class _ScreenHomePartition extends State<ScreenHomePartition> {
  late UserGroup userGroup;
  late User userData;
  late String areaName;
  late Future<Tree> areaTree;

  List<bool> switchValue = [false, false, false, false, false];
  String iconImgBuilding = Fa6Solid.building_lock;

  Timer _timer = Timer(Duration.zero, () {});

  bool isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    areaName = widget.areaName;
    areaTree = getTreeRequest(areaName == "building" ? "ROOT" : areaName);
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
      future: areaTree,
      builder: (context, snapshot) {
        List<int> countStateDoorRoot;
        if (snapshot.data != null) {
          countStateDoorRoot = countEstateDoorDoor(snapshot.data!.root);

          if (snapshot.data != null && countStateDoorRoot[0] == 0) {
            iconImgBuilding = Mdi.office_building;
            isButtonPressed = true;
          } else {
            iconImgBuilding = Fa6Solid.building_lock;
            isButtonPressed = false;
          }
        } else {
          countStateDoorRoot = [0, 0, 0, 0];
        }

        if (snapshot.hasData) {
          return Scaffold(
              bottomNavigationBar: NavBar(
                  ItemNavSelected: (index) =>
                      ItemNavSelected(context, index, userGroup, userData)).bar,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                title: Text(areaName == "building" ? "Home" : areaName),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(areaName == "building"
                          ? "Building floors"
                          : "${areaName} areas"),
                      Visibility(
                          child: IconButton(
                        icon: Iconify(iconImgBuilding),
                        onPressed: () {
                          if (!isButtonPressed) {
                            if (countStateDoorRoot[3] == 0) {
                              lockAllDoor(snapshot.data!.root);
                            } else {
                              AlertHelper.showAlert(
                                  context,
                                  "Full non-lockable area",
                                  "There are doors that are open. Close all doors to block the complete area.");
                            }
                          } else if (isButtonPressed) {
                            unlocAllkDoor(snapshot.data!.root);
                          }
                          setState(() {
                            if (!isButtonPressed) {
                              if (countStateDoorRoot[3] == 0) {
                                iconImgBuilding = Mdi.office_building;
                                isButtonPressed = true;
                                areaTree = getTreeRequest(
                                    areaName == "building" ? "ROOT" : areaName);
                              }
                            } else if (isButtonPressed) {
                              iconImgBuilding = Fa6Solid.building_lock;
                              isButtonPressed = false;
                              areaTree = getTreeRequest(
                                  areaName == "building" ? "ROOT" : areaName);
                            }
                          });
                        },
                      ))
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: snapshot.data!.root.children.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildRow(snapshot.data!.root.children[index], index),
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

  Widget _buildRow(Area area, int index) {
    String iconIMG;
    List<int> countStateDoor = countEstateDoorDoor(area);

    switchValue[index] = area.children.isNotEmpty && countStateDoor[0] == 0;

    if (index == 0) {
      iconIMG = Mdi.home_floor_negative_1;
    } else if (index == 1) {
      iconIMG = Mdi.home_floor_0;
    } else {
      iconIMG = Mdi.home_floor_1;
    }

    return GestureDetector(
      onTap: () {
        if (area.children.isNotEmpty) {
          _timer.cancel();
          if (area is Partition) {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(
              builder: (context) => ScreenHomePartition(
                  userGroup: userGroup, userData: userData, areaName: area.id),
            ))
                .then((var value) {
              _activateTimer();
              _refresh();
            });
          }
          if (area is Space) {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(
              builder: (context) => ScreenSpace(
                  userGroup: userGroup, userData: userData, areaName: area.id),
            ))
                .then((var value) {
              _activateTimer();
              _refresh();
            });
          }
        } else {
          AlertHelper.showAlert(context, "Non-accessible area",
              "It is not possible to access the area, because it has no doors. \nContact the administrator.");
        }
      },
      child: Card(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  Iconify(iconIMG),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        area.id,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      Text(
                          '${area.children.length} ${area.children.isNotEmpty && area.children[0] is Door ? "Doors" : "Area"} ${area is Partition ? '- ${countStateDoor[2] + countStateDoor[3]} Doors' : ''}',
                          style: const TextStyle(fontSize: 15.0)),
                      Text(
                        '${countStateDoor[1]} Locked doors - ${countStateDoor[2]} Closed doors',
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: switchValue[index] == true
                              ? Colors.blue
                              : Colors.white),
                      child: Column(children: [
                        Iconify(switchValue[index]
                            ? MaterialSymbols.lock_open_outline
                            : MaterialSymbols.lock_outline),
                      ]),
                      onPressed: () {
                        if (area.children.isNotEmpty) {
                          if (switchValue[index] == true) {
                            unlocAllkDoor(area);
                          } else if (switchValue[index] == false) {
                            if (countStateDoor[3] == 0) {
                              lockAllDoor(area);
                            } else {
                              AlertHelper.showAlert(
                                  context,
                                  "Non-lockable area",
                                  "There are doors that are open. Close all doors to block the area.");
                            }
                          }
                        } else {
                          AlertHelper.showAlert(context, "Non-lockable area",
                              "It is not possible to lock the doors of the area, because it does not have.");
                        }
                        setState(() {
                          if (area.children.isNotEmpty) {
                            if (switchValue[index] == true) {
                              switchValue[index] = false;
                            } else if (switchValue[index] == false) {
                              if (countStateDoor[3] == 0) {
                                switchValue[index] = true;
                              }
                            }
                            areaTree = getTreeRequest(
                                areaName == "building" ? "ROOT" : areaName);
                          }
                        });
                      }),
                ],
              ))),
    );
  }

  void _refresh() async {
    areaTree = getTreeRequest(areaName == "building" ? "ROOT" : areaName);
    setState(() {});
  }

  void _activateTimer() {
    _timer = Timer.periodic(const Duration(seconds: periodeRefresh), (Timer t) {
      areaTree = getTreeRequest(areaName == "building" ? "ROOT" : areaName);
      setState(() {});
    });
  }
}
