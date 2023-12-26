import 'package:agile_access/main.dart';
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
  late Tree doorTree;

  List<bool> switchValue = [false, false, false];
  String iconImgBuilding = Fa6Solid.building_lock;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    areaName = widget.areaName;
    doorTree = getTree(areaName);
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
          title: Text(areaName == "building" ? "Home" : areaName),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(areaName == "building"
                        ? "Building floors"
                        : "${areaName} areas")),
                Visibility(
                    child: IconButton(
                  icon: Iconify(iconImgBuilding),
                  onPressed: () {
                    setState(() {
                      bool allFalse =
                          switchValue.every((value) => value == true);
                      switchValue = List.filled(switchValue.length, !allFalse);
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
                padding: const EdgeInsets.all(10.0),
                itemCount: doorTree.root.children.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildRow(doorTree.root.children[index], index),
              ),
            )
          ],
        ));
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
        if (doorTree.root.children[index] is Partition) {
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => ScreenHomePartition(
                userGroup: userGroup,
                userData: userData,
                areaName: doorTree.root.children[index].id),
          ));
        }
        if (doorTree.root.children[index] is Space) {
          Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => ScreenSpace(
                userGroup: userGroup,
                userData: userData,
                areaName: doorTree.root.children[index].id),
          ));
        }
      },
      child: Card(
          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  Padding(
                      child: Iconify(iconIMG),
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        area.id,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      Text('${doorTree.root.children.length}' " Areas",
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
                        Future<Tree> futureTree = lockAllDoor(area);
                        await futureTree;
                        setState(() {
                          switchValue[index] = value;
                          if (switchValue[index] == true) {
                            futureTree
                                .then((Tree tree) => {
                                      doorTree.root.children[index].children =
                                          tree.root.children
                                    })
                                .catchError((error) {
                              print(error);
                            });
                          }
                        });
                      }),
                ],
              ))),
    );
  }
}
