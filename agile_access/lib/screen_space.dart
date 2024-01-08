import 'dart:async';

import 'package:agile_access/utils/last_visited_function.dart';
import 'package:agile_access/utils/nav_functions.dart';
import 'package:agile_access/utils/requests_function.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:agile_access/generated/l10n.dart';

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
  late Future<Tree> doorTree;

  Timer _timer = Timer(Duration.zero, () {});

  int idxNavBar = 0;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    areaName = widget.areaName;
    doorTree = getTreeRequest(areaName);
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
          return Scaffold(
              bottomNavigationBar: NavBar(ItemNavSelected: (index) {
                _timer.cancel();
                ItemNavSelected(context, index, userGroup, userData);
              }).bar,
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                title: Text(areaName == "building" ? "Home" : areaName),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${S.of(context).spaceDoors(areaName)}"),
                  Text(
                      "${S.of(context).spaceNumDoors(snapshot.data!.root.children.length)}"),
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

  Widget _buildRow(Door door, int index) {
    return GestureDetector(
      onTap: () {
        _timer.cancel();
        controlLastVisited(door);
        userData.lastVisited = LastVisitedControl(userData.lastVisited, door);
        Navigator.of(context)
            .push(MaterialPageRoute<void>(
          builder: (context) =>
              ScreenDoor(userGroup: userGroup, userData: userData, door: door),
        ))
            .then((var value) {
          _activateTimer();
          _refresh();
        });
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
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: door.state == "unlocked"
                                ? "${S.of(context).unlocked}"
                                : "${S.of(context).locked}",
                            style: TextStyle(
                                color: door.state == "locked"
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 15.0)),
                        const TextSpan(text: " - "),
                        TextSpan(
                            text: door.closed == true
                                ? "${S.of(context).close}"
                                : "${S.of(context).open}",
                            style: TextStyle(
                                color: door.closed == true
                                    ? Colors.red
                                    : Colors.green,
                                fontSize: 15.0)),
                      ])),
                    ],
                  ),
                ],
              ))),
    );
  }

  void _refresh() async {
    doorTree = getTreeRequest(areaName);
    setState(() {});
  }

  void _activateTimer() {
    _timer = Timer.periodic(const Duration(seconds: periodeRefresh), (Timer t) {
      doorTree = getTreeRequest(areaName == "building" ? "ROOT" : areaName);
      setState(() {});
    });
  }
}
