import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  String _url = DotEnv().env['BASE_URL'];
  bool _isBusy = false;

  bool get isBusy => this._isBusy;
  set isBusy(bool value) {
    this._isBusy = value;
    notifyListeners();
  }

  Future<bool> login(String user, String password) async {
    this.isBusy = true;
    final url = Uri.http(_url, 'flutter/', {
      'usuario': user,
      'password': password,
    });

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    this.isBusy = false;

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body);

      return decodeData == 1;
    }

    return false;
  }
}
