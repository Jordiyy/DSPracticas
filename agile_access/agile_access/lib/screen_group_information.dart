import 'package:agile_access/utils/nav_functions.dart';
import 'package:flutter/material.dart';
import 'package:agile_access/generated/l10n.dart';

import 'package:agile_access/data/user_data.dart';
import 'nav_bar.dart';

// ignore: must_be_immutable
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
          title: Text("${S.of(context).groupAppBar}"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            Text(
              "${S.of(context).groupInfo}",
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).groupName}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(userGroup.name, style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              )),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${S.of(context).groupDescription}",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Text(userGroup.description,
                        style: const TextStyle(fontSize: 15.0)),
                  ],
                ),
              )),
            ),
          ],
        ));
  }
}
