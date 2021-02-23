import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:gh_medic/src/bloc/gh_provider.dart';
import 'package:gh_medic/src/routes/routes.dart';
import 'package:gh_medic/src/services/auth_service.dart';
import 'package:gh_medic/src/utils/theme_app_data.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GHProvider(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => AuthService(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          initialRoute: 'login',
          routes: getApplicationRoutes(),
          theme: themeAppData.setThemeAppData(),
        ),
      ),
    );
  }
}
