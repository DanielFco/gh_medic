import 'package:flutter/material.dart';
import 'package:gh_medic/src/bloc/form_bloc.dart';

class GHProvider extends InheritedWidget {
  static GHProvider _instance;
  factory GHProvider({Key key, Widget child}) {
    if (_instance == null) {
      _instance = new GHProvider._internal(
        key: key,
        child: child,
      );
    }
    return _instance;
  }

  GHProvider._internal({Key key, Widget child}) : super(key: key, child: child);
  final formBloc = FormBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static FormBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GHProvider>().formBloc;
  }
}
