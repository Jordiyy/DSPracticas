import 'package:agile_access/main.dart';
import 'package:agile_access/utils/nav_bar_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/uil.dart';

import 'package:agile_access/data/user_data.dart';
import 'nav_bar.dart';

class ScreenUserInformation extends StatefulWidget {
  UserGroup userGroup;
  User userData;

  ScreenUserInformation({
    super.key,
    required this.userGroup,
    required this.userData,
  });

  @override
  State<ScreenUserInformation> createState() => _ScreenUserInformation();
}

class _ScreenUserInformation extends State<ScreenUserInformation> {
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
        title: const Text(
          "User Information",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "User account Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Center(
                  child: CircleAvatar(
                      radius: 100,
                      foregroundImage: NetworkImage(
                          usersData.images[userData.name.toLowerCase()]!))),
              Card(
                  color: AgileAccessColors.azul4,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(userData.name, style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                  )),
              Card(
                  color: AgileAccessColors.azul4,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Credentials",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(userData.credential,
                            style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                  )),
              Card(
                  color: AgileAccessColors.azul4,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Group",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(userGroup.name, style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
