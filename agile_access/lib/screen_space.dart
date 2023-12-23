import 'package:agile_access/screen_home_partition.dart';
import 'package:agile_access/utils/last_visited_function.dart';
import 'package:agile_access/utils/nav_bar_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import 'package:agile_access/data/user_data.dart';
import 'screen_door.dart';
import 'data/door_tree.dart';
import 'nav_bar.dart';

class ScreenSpace extends StatefulWidget {
  UserGroup userGroup;
  User userData;
  String areaName;

  ScreenSpace(
      {super.key,
      required this.userGroup,
      required this.userData,
      required this.areaName});

  @override
  State<ScreenSpace> createState() => _ScreenSpace();
}

class _ScreenSpace extends State<ScreenSpace> {
  late UserGroup userGroup;
  late User userData;
  late String areaName;
  late Tree doorTree;
  int idxNavBar = 0;
  List<bool> switchValue = [false, false, false];

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
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(areaName == "building" ? "Home" : areaName),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${areaName} doors"),
            Text("You have acces to "
                '${doorTree.root.children.length}'
                " doors"),
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

  Widget _buildRow(Door door, int index) {
    return GestureDetector(
      onTap: () {
        controlLastVisited(doorTree, index);
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (context) => ScreenDoor(
              userGroup: userGroup,
              userData: userData,
              door: doorTree.root.children[index]),
        ));
      },
      child: Card(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  Iconify(Bi.door_closed),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        door.id,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      Text("Unlocked - Closed",
                          style: const TextStyle(fontSize: 15.0)),
                    ],
                  ),
                ],
              ))),
    );
  }
}
