import 'package:flutter/material.dart';

class CloseSessionAlert extends StatelessWidget {
  final Function function;

  CloseSessionAlert({@required this.function});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('¿Quieres cerrar sesión?'),
      content: Text(
          'Esto cerrará tu sesión y pedirá de nuevo tus credenciales para ingresar.'),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        FlatButton(
          onPressed: this.function,
          child: Text('Aceptar'),
        ),
      ],
    );
  }
}
