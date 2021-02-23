import 'package:flutter/material.dart';
import 'package:gh_medic/src/bloc/form_bloc.dart';
import 'package:gh_medic/src/bloc/gh_provider.dart';
import 'package:gh_medic/src/helpers/dialog_helper.dart';
import 'package:gh_medic/src/models/employee_response.dart';
import 'package:gh_medic/src/services/employee_service.dart';
import 'package:gh_medic/src/utils/catalogs.dart';
import 'package:gh_medic/src/widgets/dbw_raised_button.dart';
import 'package:gh_medic/src/widgets/dbw_text_field.dart';
import 'package:intl/intl.dart';

enum Gender { hombre, mujer }

class RegisterFormWidget extends StatefulWidget {
  final EmployeeResponse employee;
  RegisterFormWidget({@required this.employee});

  @override
  _RegisterFormWidgetState createState() =>
      _RegisterFormWidgetState(this.employee);
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  EmployeeResponse employeeResponse;
  final _employeeService = EmployeeService();
  Gender _gender = Gender.hombre;
  int _departmentId;
  int _countryId;
  int _stateId;
  int _genderId = 1;
  String _date;
  bool _newEmployee;
  String _departmentSelected;
  String _countrySelected;
  String _stateSelected;
  TextEditingController dateController = new TextEditingController();

  FormBloc bloc;

  _RegisterFormWidgetState(EmployeeResponse employee) {
    this.employeeResponse = employee;
  }

  Widget _buildNameTextField() {
    return StreamBuilder(
      stream: bloc.nameStream,
      builder: (context, snapshot) {
        return DBWTextField(
          inputType: TextInputType.name,
          icon: Icons.text_fields,
          placeHolder: 'Nombre',
          onChange: bloc.changeName,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _buildDateTextField(BuildContext context) {
    return StreamBuilder(
      stream: bloc.dateStream,
      builder: (context, snapshot) {
        return DBWTextField(
          textController: dateController,
          inputType: TextInputType.datetime,
          icon: Icons.calendar_today,
          placeHolder: 'Fecha de ingreso',
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            _selectDate(context);
          },
          onChange: bloc.changeDate,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _buildDepartmentDropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.business_center),
        StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return DropdownButton(
                hint: Text('Departamento'),
                value: _departmentSelected,
                items: _getDepartmentOptions(),
                onChanged: (opt) {
                  setState(() {
                    _departmentSelected = opt;
                  });
                },
              );
            }),
      ],
    );
  }

  Widget _buildCountryDropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.location_on),
        StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return DropdownButton(
                hint: Text('País'),
                value: _countrySelected,
                items: _getCountryOptions(),
                onChanged: (opt) {
                  setState(() {
                    _countrySelected = opt;
                  });
                },
              );
            }),
      ],
    );
  }

  Widget _buildStateDropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.location_city),
        StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return DropdownButton(
                hint: Text('Estados'),
                value: _stateSelected,
                items: _getStateOptions(),
                onChanged: (opt) {
                  setState(() {
                    _stateSelected = opt;
                  });
                },
              );
            }),
      ],
    );
  }

  Widget _buildLoginButton() {
    return StreamBuilder(
        stream: bloc.formRegisterValidStream,
        builder: (context, snapshot) {
          return DBWRaisedButton(
            textColor: Colors.white,
            text: employeeResponse == null ? 'Registrar' : 'Actualizar',
            onPressed: _employeeService.isBusy
                ? null
                : () async {
                    final registered = await _employeeService.addEmployee(
                      bloc.name.trim(),
                      _departmentId.toString(),
                      _genderId.toString(),
                      _date,
                      _countryId.toString(),
                      _stateId.toString(),
                    );
                    if (registered) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      DialogHelper.generalAlert(
                          context,
                          'Error de registro',
                          'Error al crear el registro',
                          'Es enecesario validar todos los datos');
                    }
                  },
          );
        });
  }

  Widget _buildGenderOpt() {
    return Row(
      children: [
        Text('Hombre'),
        Radio(
            value: Gender.hombre,
            groupValue: _gender,
            onChanged: (Gender value) {
              setState(() {
                _gender = value;
                _genderId = value == Gender.hombre ? 1 : 0;
              });
            }),
        Text('Mujer'),
        Radio(
            value: Gender.mujer,
            groupValue: _gender,
            onChanged: (Gender value) {
              setState(() {
                _gender = value;
                _genderId = value == Gender.hombre ? 1 : 0;
              });
            }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    this.bloc = GHProvider.of(context);

    return Container(
      margin: EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          _buildNameTextField(),
          _buildDateTextField(context),
          _buildGenderOpt(),
          _buildDepartmentDropDown(),
          _buildCountryDropDown(),
          _buildStateDropDown(),
          SizedBox(
            height: 20,
          ),
          _buildLoginButton(),
        ],
      ),
    );
  }

  List<DropdownMenuItem> _getDepartmentOptions() {
    List<DropdownMenuItem> options = new List();
    getDepartmets().forEach((key, value) {
      var option = DropdownMenuItem(
        child: Text(key),
        value: key,
        onTap: () {
          setState(() {
            _departmentId = value;
          });
        },
      );
      options.add(option);
    });

    return options;
  }

  List<DropdownMenuItem> _getCountryOptions() {
    List<DropdownMenuItem> options = new List();
    getCountries().forEach((key, value) {
      var option = DropdownMenuItem(
        child: Text(key),
        value: key,
        onTap: () {
          setState(() {
            _countryId = value;
          });
        },
      );
      options.add(option);
    });

    return options;
  }

  List<DropdownMenuItem> _getStateOptions() {
    List<DropdownMenuItem> options = new List();
    getStates().forEach((key, value) {
      var option = DropdownMenuItem(
        child: Text(key),
        value: key,
        onTap: () {
          setState(() {
            _stateId = value;
          });
        },
      );
      options.add(option);
    });

    return options;
  }

  _selectDate(BuildContext context) async {
    final formatDate = new DateFormat('yyyy-MM-dd');
    DateTime picker;
    picker = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime.now(),
      lastDate: new DateTime(2030),
    );

    setState(() {
      _date = formatDate.format(picker).toString();
      dateController.text = _date;
    });
  }
}
