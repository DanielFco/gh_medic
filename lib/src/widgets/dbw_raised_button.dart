import 'package:flutter/material.dart';

class DBWRaisedButton extends StatelessWidget {
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double fontSize;
  final double buttonHeight;

  DBWRaisedButton(
      {@required this.text,
      this.onPressed,
      this.backgroundColor,
      this.textColor = Colors.black,
      this.fontSize = 18.0,
      this.buttonHeight = 50.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: this.backgroundColor != null
            ? this.backgroundColor
            : Theme.of(context).accentColor,
        shape: StadiumBorder(),
        onPressed: onPressed,
        child: Container(
          height: buttonHeight,
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
