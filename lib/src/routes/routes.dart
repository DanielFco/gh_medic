import 'package:flutter/material.dart';
import 'package:gh_medic/src/pages/employee_detail_page.dart';

import 'package:gh_medic/src/pages/home_page.dart';
import 'package:gh_medic/src/pages/login_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'details': (BuildContext context) => EmployeeDetailPage(),
  };
}
