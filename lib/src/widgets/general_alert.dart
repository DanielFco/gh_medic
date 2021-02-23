import 'package:flutter/material.dart';

class GeneralAlert extends StatelessWidget {
  final String title;
  final String subtitle;
  final String message;

  GeneralAlert(
      {@required this.title, @required this.subtitle, @required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.message),
      actions: [
        RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        ),
      ],
    );
  }
}
