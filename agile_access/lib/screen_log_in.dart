import 'package:agile_access/generated/l10n.dart';
import 'package:agile_access/main.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'data/user_data.dart';
import 'screen_home_partition.dart';

class ScreenSingUp extends StatefulWidget {
  const ScreenSingUp({super.key});

  @override
  State<ScreenSingUp> createState() => _ScreenSingUp();
}

class _ScreenSingUp extends State<ScreenSingUp> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _userNameController;
  late User userData;
  late UserGroup userGroup;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AgileAccessColors.azul3,
        foregroundColor: AgileAccessColors.text,
        title: const Text("Agile Access"),
      ),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //const Text("Log in"),
          Text(AppLocalizations.of(context)!.logInFormTitle),
          TextFormField(
            controller: _userNameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "User name"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter name user ';
              }
              User? userFound;
              for (UserGroup group in usersData.userGroups) {
                userFound =
                    group.users.firstWhereOrNull((user) => user.name == value);
                if (userFound != null) {
                  userData = userFound;
                  userGroup = group;
                  break;
                }
              }
              return userFound != null ? null : "User not found";
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => ScreenHomePartition(
                        userGroup: userGroup,
                        userData: userData,
                        areaName: userGroup.areas.first),
                  ));
                }
              },
              child: const Text("Submit"),
            ),
          )
        ]),
      ),
    );
  }
}
