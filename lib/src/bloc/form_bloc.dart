import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:rxdart/rxdart.dart';

import 'package:gh_medic/src/bloc/validators.dart';

class FormBloc with Validators {
  final _nameController = BehaviorSubject<String>();
  final _userController = BehaviorSubject<String>();
  final _departmentController = BehaviorSubject<String>();
  final _genderController = BehaviorSubject<String>();
  final _countryController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _dateController = BehaviorSubject<String>();

  Stream<String> get nameStream =>
      _nameController.stream.transform(validateName);
  Stream<String> get userStream =>
      _userController.stream.transform(validateUser);
  Stream<String> get departmentStream =>
      _departmentController.stream.transform(validateDepartment);
  Stream<String> get genderStream =>
      _genderController.stream.transform(validateGender);
  Stream<String> get countryStream =>
      _countryController.stream.transform(validateCountry);
  Stream<String> get stateStream =>
      _stateController.stream.transform(validateState);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<String> get dateStream =>
      _dateController.stream.transform(validateDate);

  Stream<bool> get formLoginValidStream =>
      Rx.combineLatest2(userStream, passwordStream, (a, b) => true);
  Stream<bool> get formRegisterValidStream => Rx.combineLatest7(
      nameStream,
      userStream,
      departmentStream,
      genderStream,
      countryStream,
      stateStream,
      dateStream,
      (a, b, c, d, e, f, g) => true);

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeUser => _userController.sink.add;
  Function(String) get changeDepartment => _departmentController.sink.add;
  Function(String) get changeGender => _genderController.sink.add;
  Function(String) get changeCountry => _genderController.sink.add;
  Function(String) get changeState => _genderController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeDate => _dateController.sink.add;

  String get name => _nameController.value;
  String get user => _userController.value;
  String get department => _departmentController.value;
  String get gender => _genderController.value;
  String get country => _countryController.value;
  String get state => _stateController.value;
  String get password => _passwordController.value;
  String get date => _dateController.value;

  dispose() {
    _nameController?.close();
    _userController?.close();
    _departmentController?.close();
    _genderController?.close();
    _countryController?.close();
    _stateController?.close();
    _passwordController?.close();
    _dateController?.close();
  }

  reset() {
    _nameController.value = '';
    _userController.value = '';
    _departmentController.value = '';
    _genderController.value = '';
    _countryController.value = '';
    _stateController.value = '';
    _passwordController.value = '';
    _dateController.value = '';
  }
}
