import 'package:flutter/material.dart';
import 'package:gh_medic/src/bloc/gh_provider.dart';
import 'package:gh_medic/src/helpers/dialog_helper.dart';
import 'package:gh_medic/src/models/employee_response.dart';
import 'package:gh_medic/src/services/employee_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EmployeeResponse> _employees = [];
  final _employeeService = EmployeeService();

  @override
  void initState() {
    _getEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = GHProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('GHMedic'),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () async {
            await DialogHelper.closeSessionAlert(context, () {
              bloc.reset();
              Navigator.pop(context);
            });
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
      body: _buildListViewUsers(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'details');
        },
      ),
    );
  }

  ListView _buildListViewUsers() {
    return ListView.separated(
      itemBuilder: (context, i) => _usersListTile(_employees[i]),
      separatorBuilder: (context, i) => Divider(),
      itemCount: _employees.length,
    );
  }

  ListTile _usersListTile(EmployeeResponse employee) {
    return ListTile(
      title: Text(employee.nombre),
      subtitle: Text(employee.departamento),
      leading: CircleAvatar(
        child: Text(employee.nombre.substring(0, 2)),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: employee);
      },
    );
  }

  Future _getEmployees() async {
    this._employees = await _employeeService.getEmployees();
    setState(() {});
  }
}
