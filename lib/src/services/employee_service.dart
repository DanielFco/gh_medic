import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gh_medic/src/models/employee_response.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  String _url = DotEnv().env['BASE_URL'];
  bool _isBusy = false;

  bool get isBusy => this._isBusy;
  set isBusy(bool value) {
    this._isBusy = value;
  }

  Future<List<EmployeeResponse>> getEmployees() async {
    final url = Uri.http(_url, 'flutter/');

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        final userResponse = employeeResponseFromJson(response.body);

        return userResponse;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> addEmployee(String name, String department, String gender,
      String date, String country, String state) async {
    final url = Uri.http(_url, 'flutter/');

    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'Nombre': name,
            'Departamento': department,
            'Sexo': gender,
            'FechaIngreso': date,
            'Pais': country,
            'Estado': state,
          }));

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateEmployee(String name, String department, String gender,
      String date, String country, String state) async {
    final url = Uri.http(_url, 'flutter/');

    try {
      final response = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'Nombre': name,
            'Departamento': department,
            'Sexo': gender,
            'FechaIngreso': date,
            'Pais': country,
            'Estado': state,
          }));

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteEmployee(String id) async {
    final url = Uri.http(_url, 'flutter/', {'id': id});

    try {
      final response = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
