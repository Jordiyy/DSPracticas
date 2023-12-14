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
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("User Information"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("User account Information"),
            CircleAvatar(
                radius: 150,
                foregroundImage: NetworkImage(
                    usersData.images[userData.name.toLowerCase()]!)),
            Card(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(userData.name, style: TextStyle(fontSize: 15.0)),
                ],
              ),
            )),
            Card(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Credentials",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(userData.credential, style: TextStyle(fontSize: 15.0)),
                ],
              ),
            )),
            Card(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Group",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(userGroup.name, style: TextStyle(fontSize: 15.0)),
                ],
              ),
            )),
          ],
        ));
  }
}
