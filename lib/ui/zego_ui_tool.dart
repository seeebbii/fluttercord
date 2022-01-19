import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ZegoUITool {

  static showAlert(BuildContext context, String message) {
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Tips'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }

}