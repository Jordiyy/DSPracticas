import 'package:agile_access/main.dart';
import 'package:agile_access/screen_group_information.dart';
import 'package:agile_access/screen_schedule_information.dart';
import 'package:agile_access/screen_user_information.dart';
import 'package:agile_access/utils/nav_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:agile_access/generated/l10n.dart';

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
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("User profile"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("User account"),
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
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                      child: Row(
                        children: [
                          Iconify(MaterialSymbols.info_outline),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User",
                                style: TextStyle(fontSize: 15.0),
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
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                      child: Row(
                        children: [
                          Iconify(Ic.baseline_groups),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Group",
                                style: TextStyle(fontSize: 15.0),
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
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                      child: Row(
                        children: [
                          Iconify(Uil.schedule),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Schedule",
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text("User schedule information",
                                  style: TextStyle(fontSize: 15.0)),
                            ],
                          ),
                        ],
                      ))),
            ),
            GestureDetector(
              child: Card(
                  margin: EdgeInsets.all(10),
                  color: AgileAccessColors.azul4,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Iconify(Uil.schedule)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Idiomas",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(children: [
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        S.load(const Locale('es', 'ES'));
                                      });
                                    },
                                    child: Text("Español")),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        S.load(const Locale('en', 'US'));
                                      });
                                    },
                                    child: Text("Inglés")),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        S.load(const Locale('de', 'DE'));
                                      });
                                    },
                                    child: Text("Alemán")),
                              ])
                            ],
                          ),
                        ],
                      ))),
            ),
          ],
        ));
  }
}
