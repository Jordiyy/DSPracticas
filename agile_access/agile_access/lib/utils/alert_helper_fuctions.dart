import 'package:flutter/material.dart';

class AlertHelper {
  static void showAlert(BuildContext context, String tittle, String message) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(tittle),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            )),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Accept"))
            ],
          );
        });
  }
}
