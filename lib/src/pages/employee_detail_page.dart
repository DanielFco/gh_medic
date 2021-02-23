import 'package:flutter/material.dart';
import 'package:gh_medic/src/models/employee_response.dart';
import 'package:gh_medic/src/widgets/register_form_widget.dart';

class EmployeeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmployeeResponse employeeResponse =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: employeeResponse == null
            ? Text('Nuevo empleado')
            : Text('Detalles'),
      ),
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
                  RegisterFormWidget(
                    employee: employeeResponse,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
