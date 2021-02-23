import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gh_medic/src/bloc/form_bloc.dart';
import 'package:gh_medic/src/bloc/gh_provider.dart';
import 'package:gh_medic/src/services/auth_service.dart';
import 'package:gh_medic/src/helpers/dialog_helper.dart';
import 'package:gh_medic/src/widgets/dbw_raised_button.dart';
import 'package:gh_medic/src/widgets/dbw_text_field.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  AuthService authService;
  FormBloc bloc;
  Size size;

  Widget _buildPhoneText() {
    return StreamBuilder(
      stream: bloc.userStream,
      builder: (context, snapshot) {
        return DBWTextField(
          inputType: TextInputType.text,
          icon: Icons.person_sharp,
          placeHolder: 'Usuario',
          onChange: bloc.changeUser,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _buildPasswordText() {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return DBWTextField(
          icon: Icons.lock,
          isPassword: true,
          placeHolder: 'Contraseña',
          onChange: bloc.changePassword,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _buildLoginButton() {
    return StreamBuilder(
      stream: bloc.formLoginValidStream,
      builder: (context, snapshot) {
        return DBWRaisedButton(
          textColor: Colors.white,
          text: 'Ingresar',
          onPressed: !snapshot.hasData
              ? null
              : authService.isBusy
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final loginOk = await authService.login(
                        bloc.user.trim(),
                        bloc.password.trim(),
                      );

                      if (loginOk) {
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        DialogHelper.generalAlert(
                            context,
                            'Error de autenticación',
                            'Credenciales inválidas',
                            'Usuario o contraseña son incorrectos');
                      }
                    },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    this.authService = Provider.of<AuthService>(context, listen: false);
    this.bloc = GHProvider.of(context);
    this.size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.05),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
      child: Column(
        children: [
          _buildPhoneText(),
          _buildPasswordText(),
          SizedBox(
            height: 20,
          ),
          _buildLoginButton(),
        ],
      ),
    );
  }
}
