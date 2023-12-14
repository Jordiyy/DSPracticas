import 'package:agile_access/screen_home_partition.dart';
import 'package:agile_access/utils/nav_bar_functions.dart';
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
  String doorName;

  ScreenDoor(
      {super.key,
      required this.userGroup,
      required this.userData,
      required this.doorName});

  @override
  State<ScreenDoor> createState() => _ScreenDoor();
}

class _ScreenDoor extends State<ScreenDoor> {
  late UserGroup userGroup;
  late User userData;
  late String doorName;
  int idxNavBar = 0;

  List<String> iconList = [
    Bi.door_open,
    MaterialSymbols.lock_outline,
    MaterialSymbols.lock_clock_outline
  ];

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
    doorName = widget.doorName;
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
          title: Text("Door $doorName"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$doorName options"),
            const Text("Unlocked - Closed"),
            Row(
              children: [
                ElevatedButton(
                    child: Column(
                        children: [Iconify(iconList[0]), const Text("Open")]),
                    onPressed: () {
                      userData.history.add({
                        doorName:
                            "${DateFormat('dd/MM/yyyy').format(DateTime.now())}\n $userData.name blocked the door."
                      });
                      setState(() {
                        iconList[0] = iconList[0] == Bi.door_open
                            ? Bi.door_closed
                            : Bi.door_open;
                      });
                    }),
                ElevatedButton(
                    child: Column(children: [
                      Iconify(iconList[1]),
                      const Text("Lock door")
                    ]),
                    onPressed: () {
                      userData.history.add({
                        doorName:
                            "${DateFormat('dd/MM/yyyy').format(DateTime.now())}\n $userData.name blocked the door."
                      });
                      setState(() {
                        iconList[1] =
                            iconList[1] == MaterialSymbols.lock_outline
                                ? MaterialSymbols.lock_open_outline
                                : MaterialSymbols.lock_outline;
                      });
                    }),
                ElevatedButton(
                    child: Column(children: [
                      Iconify(iconList[2]),
                      const Text("Unlocked\nShortly")
                    ]),
                    onPressed: () {
                      userData.history.add({
                        doorName:
                            "${DateFormat('dd/MM/yyyy').format(DateTime.now())}\n $userData.name blocked the door."
                      });
                      setState(() {
                        iconList[2] =
                            iconList[2] == MaterialSymbols.lock_clock_outline
                                ? MaterialSymbols.lock_reset
                                : MaterialSymbols.lock_clock_outline;
                      });
                    }),
              ],
            ),
            Text("History"),
            Expanded(
              child: userData.history.isEmpty
                  ? Text("No data in history")
                  : ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: userData.history.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildRow(userData.history[index], doorName),
                    ),
            )
          ],
        ));
  }

  Widget _buildRow(Map<String, String> info, String doorN) {
    String? name = info[doorN];

    if (name == null) {
      return Text("No data in history");
    } else {
      return Card(child: Text(name));
    }
  }
}
