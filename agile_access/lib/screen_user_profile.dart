import 'package:agile_access/main.dart';
import 'package:agile_access/screen_group_information.dart';
import 'package:agile_access/screen_schedule_information.dart';
import 'package:agile_access/screen_user_information.dart';
import 'package:agile_access/utils/nav_bar_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/uil.dart';

import 'package:agile_access/data/user_data.dart';
import 'nav_bar.dart';

class ScreenUserProfile extends StatefulWidget {
  UserGroup userGroup;
  User userData;

  ScreenUserProfile({
    super.key,
    required this.userGroup,
    required this.userData,
  });

  @override
  State<ScreenUserProfile> createState() => _ScreenUserProfile();
}

class _ScreenUserProfile extends State<ScreenUserProfile> {
  late UserGroup userGroup;
  late User userData;

  @override
  void initState() {
    super.initState();
    userGroup = widget.userGroup;
    userData = widget.userData;
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
          title: const Text("User profile",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("User account",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => ScreenUserInformation(
                        userGroup: userGroup,
                        userData: userData,
                      ),
                    ));
                  },
                  child: const Card(
                      margin: const EdgeInsets.all(10),
                      color: AgileAccessColors.azul4,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Iconify(MaterialSymbols.info_outline)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "User",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("User information",
                                      style: TextStyle(fontSize: 15.0)),
                                ],
                              ),
                            ],
                          ))),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => ScreenGroupInformation(
                        userGroup: userGroup,
                        userData: userData,
                      ),
                    ));
                  },
                  child: const Card(
                      margin: const EdgeInsets.all(10),
                      color: AgileAccessColors.azul4,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Iconify(Ic.baseline_groups)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Group",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("User group information",
                                      style: TextStyle(fontSize: 15.0)),
                                ],
                              ),
                            ],
                          ))),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => ScreenScheduleInformation(
                        userGroup: userGroup,
                        userData: userData,
                      ),
                    ));
                  },
                  child: const Card(
                      margin: const EdgeInsets.all(10),
                      color: AgileAccessColors.azul4,
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Iconify(Uil.schedule)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Schedule",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("User schedule information",
                                      style: TextStyle(fontSize: 15.0)),
                                ],
                              ),
                            ],
                          ))),
                ),
              ],
            )));
  }
}
