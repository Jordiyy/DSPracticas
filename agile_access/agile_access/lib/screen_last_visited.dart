import 'package:agile_access/data/user_data.dart';
import 'package:agile_access/nav_bar.dart';
import 'package:agile_access/screen_home_partition.dart';
import 'package:agile_access/screen_space.dart';
import 'package:agile_access/utils/nav_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:agile_access/generated/l10n.dart';

import 'data/door_tree.dart';

// ignore: must_be_immutable
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
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text("${S.of(context).lastVisitedAppBar}"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "${S.of(context).doorHistory}",
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Expanded(
              //child: LastVisited.lastVisitedList.isEmpty
              child: userData.lastVisited.isEmpty
                  ? Text("${S.of(context).doorNoHistoryList}")
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: userData.lastVisited.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildRow(userData.lastVisited[index], index),
                    ),
            )
          ],
        ));
  }

  Widget _buildRow(Area door, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
          if (door is Partition) {
            return ScreenHomePartition(
                userGroup: userGroup, userData: userData, areaName: door.id);
          } else {
            return ScreenSpace(
                userGroup: userGroup, userData: userData, areaName: door.id);
          }
        }));
      },
      child: Card(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Row(
                children: [
                  const Iconify(Bi.door_closed),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        door.id,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                      Text(door is Partition ? "Partition" : "Space",
                          style: const TextStyle(fontSize: 15.0)),
                    ],
                  ),
                ],
              ))),
    );
  }
}
