import 'package:agile_access/utils/nav_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/uil.dart';

import 'package:agile_access/data/user_data.dart';
import 'nav_bar.dart';

class ScreenGroupInformation extends StatefulWidget {
  UserGroup userGroup;
  User userData;

  ScreenGroupInformation({
    super.key,
    required this.userGroup,
    required this.userData,
  });

  @override
  State<ScreenGroupInformation> createState() => _ScreenGroupInformation();
}

class _ScreenGroupInformation extends State<ScreenGroupInformation> {
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
          title: const Text("Group Information"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Group account Information"),
            Card(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Group name",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(userGroup.name, style: TextStyle(fontSize: 15.0)),
                ],
              ),
            )),
            Card(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Text(userGroup.description,
                      style: const TextStyle(fontSize: 15.0)),
                ],
              ),
            )),
          ],
        ));
  }
}
