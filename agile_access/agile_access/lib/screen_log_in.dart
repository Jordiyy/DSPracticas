import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:agile_access/generated/l10n.dart';

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
    setState(() {
      S.load(const Locale('es', 'ES'));
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Agile Access"),
      ),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(S.of(context).logInFormTitle),
          TextFormField(
            controller: _userNameController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "${S.of(context).logInLabelText}"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "${S.of(context).logInEmpty}";
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
              return userFound != null ? null : "${S.of(context).logInNoUser}";
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
              child: Text(S.of(context).logInSumbit),
            ),
          )
        ]),
      ),
    );
  }
}
