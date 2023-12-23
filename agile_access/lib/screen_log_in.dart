import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'data/user_data.dart';
import 'screen_home_partition.dart';

class ScreenSingUp extends StatefulWidget {
  ScreenSingUp({super.key});

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
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Agile Access"),
      ),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Log in"),
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
            padding: EdgeInsets.all(16.0),
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
