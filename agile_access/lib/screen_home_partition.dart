import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

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
  String iconImgBuilding = Mdi.door_closed_lock;

  int idxNavBar = 0;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    areaName = widget.areaName;
    doorTree = getTree(areaName);
  }

  void _ItemNavSelected(int idx) {
    setState(() {
      idxNavBar = idx;
    });

    if (idxNavBar == 0) {
      Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => ScreenHomePartition(
            userGroup: userGroup,
            userData: userData,
            areaName: userGroup.areas.first),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:
            NavBar(ItemNavSelected: (index) => _ItemNavSelected(index)).bar,
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
                        setState(() {
                          bool allFalse =
                              switchValue.every((value) => value == true);
                          switchValue =
                              List.filled(switchValue.length, !allFalse);
                          iconImgBuilding =
                              allFalse ? Mdi.door_closed_lock : Mdi.door_closed;
                        });
                      },
                    ))
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
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
                      onChanged: (bool value) {
                        setState(() {
                          switchValue[index] = value;
                        });
                      }),
                ],
              ))),
    );
  }
}
