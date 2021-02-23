import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final String title;
  LogoWidget({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50.0),
        width: double.infinity,
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/gh_logo.png'),
              width: 150.0,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 30, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
