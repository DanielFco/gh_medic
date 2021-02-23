import 'package:flutter/material.dart';
import 'package:gh_medic/src/widgets/login_form_widget.dart';
import 'package:gh_medic/src/widgets/logo_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LogoWidget(title: 'Login'),
                  LoginFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
