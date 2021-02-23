import 'package:flutter/material.dart';

class _ThemeAppData {
  ThemeData setThemeAppData() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFFe61428),
      primaryColorLight: Color(0xFFff5a52),
      primaryColorDark: Color(0xFFab0000),
      accentColor: Color(0xFFf44336),
      scaffoldBackgroundColor: Color(0xFFF2F2F2),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFe61428),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFe61428),
      ),
    );
  }
}

final themeAppData = new _ThemeAppData();
