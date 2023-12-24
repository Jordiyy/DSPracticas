import 'package:agile_access/utils/nav_bar_functions.dart';
import 'package:agile_access/utils/requests_function.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/fa6_solid.dart';

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

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    areaName = widget.areaName;
    areaTree = getTreeQuery(areaName);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tree>(
      future: areaTree,
      builder: (context, snapshot) {
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
                          visible: areaName == "building",
                          child: IconButton(
                            icon: Iconify(iconImgBuilding),
                            onPressed: () {
                              if (switchValue
                                  .every((element) => element == false)) {
                                lockAllDoor(snapshot.data!.root);
                              } else if (switchValue
                                  .every((element) => element == true)) {
                                unlocAllkDoor(snapshot.data!.root);
                              }
                              setState(() {
                                bool allFalse =
                                    switchValue.every((value) => value == true);
                                switchValue =
                                    List.filled(switchValue.length, !allFalse);
                                iconImgBuilding = allFalse
                                    ? Fa6Solid.building_lock
                                    : Mdi.office_building;
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
            child: Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }

  Widget _buildRow(Area area, int index) {
    String iconIMG;

    if (index == 0) {
      iconIMG = Mdi.home_floor_negative_1;
    } else if (index == 1) {
      iconIMG = Mdi.home_floor_0;
    } else {
      iconIMG = Mdi.home_floor_1;
    }
    return GestureDetector(
      onTap: () {
        if (area is Partition) {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(
            builder: (context) => ScreenHomePartition(
                userGroup: userGroup, userData: userData, areaName: area.id),
          ))
              .then((var value) {
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
            _refresh();
          });
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
                      Text('${area.children.length}' " Areas",
                          style: const TextStyle(fontSize: 15.0)),
                      const Text(
                        "0 Locked doors, 0 Unlocked doors",
                        style: TextStyle(fontSize: 15.0),
                      )
                    ],
                  ),
                  Switch(
                      value: switchValue[index],
                      onChanged: (bool value) async {
                        setState(() {
                          switchValue[index] = value;
                          if (switchValue[index] == true) {
                            lockAllDoor(area);
                          } else if (switchValue[index] == false) {
                            unlocAllkDoor(area);
                          }
                        });
                      }),
                ],
              ))),
    );
  }

  void _refresh() async {
    areaTree = getTreeQuery(areaName);
    setState(() {});
  }
}
