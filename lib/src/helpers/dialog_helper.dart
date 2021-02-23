import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:gh_medic/src/widgets/close_session_alert.dart';
import 'package:gh_medic/src/widgets/general_alert.dart';

class DialogHelper {
  static generalAlert(BuildContext context, String title, String subtitle,
          String message) =>
      showDialog(
        context: context,
        builder: (context) => GeneralAlert(
          title: title,
          subtitle: subtitle,
          message: message,
        ),
      );

  static closeSessionAlert(BuildContext context, Function function) =>
      showDialog(
        context: context,
        builder: (context) => CloseSessionAlert(function: function),
      );
}
