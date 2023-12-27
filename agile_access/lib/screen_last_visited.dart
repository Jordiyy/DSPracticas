import 'package:agile_access/data/user_data.dart';
import 'package:agile_access/main.dart';
import 'package:agile_access/nav_bar.dart';
import 'package:agile_access/screen_door.dart';
import 'package:agile_access/utils/nav_bar_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';

import 'data/door_tree.dart';

class ScreenLastVisited extends StatefulWidget {
  UserGroup userGroup;
  User userData;
  String areaName;

  ScreenLastVisited(
      {super.key,
      required this.userGroup,
      required this.userData,
      required this.areaName});

  @override
  State<ScreenLastVisited> createState() => _ScreenLastVisited();
}

class _ScreenLastVisited extends State<ScreenLastVisited> {
  late UserGroup userGroup;
  late User userData;
  late String areaName;

  int idxNavBar = 0;
  List<bool> switchValue = [false, false, false];

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    areaName = widget.areaName;
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
          title: const Text(
            "Last visited",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: const Text("History",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24))),
                Expanded(
                  child: LastVisited.lastVisitedList.isEmpty
                      ? Text("No data in history")
                      : ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount: LastVisited.lastVisitedList.length,
                          itemBuilder: (BuildContext context, int index) =>
                              _buildRow(LastVisited.lastVisitedList[index]),
                        ),
                )
              ],
            )));
  }

  Widget _buildRow(Door door) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(
          builder: (context) =>
              ScreenDoor(userGroup: userGroup, userData: userData, door: door),
        ));
      },
      child: Card(
          color: AgileAccessColors.azul4,
          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: const Iconify(Bi.door_closed)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        door.id,
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      const Text("Unlocked - Closed",
                          style: TextStyle(fontSize: 15.0)),
                    ],
                  ),
                ],
              ))),
    );
  }
}
