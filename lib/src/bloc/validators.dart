import 'dart:async';

class Validators {
  final validateUser = StreamTransformer<String, String>.fromHandlers(
    handleData: (user, sink) {
      if (user.trim().isNotEmpty && user.trim().length <= 60) {
        sink.add(user);
      } else {
        sink.addError('Usuario inválido');
      }
    },
  );

  final validateName = StreamTransformer<String, String>.fromHandlers(
    handleData: (user, sink) {
      if (user.trim().isNotEmpty && user.trim().length <= 60) {
        sink.add(user);
      } else {
        sink.addError('Nombre inválido');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length >= 6) {
        sink.add(password);
      } else {
        sink.addError('Contraseña muy corta');
      }
    },
  );

  final validateDepartment = StreamTransformer<String, String>.fromHandlers(
    handleData: (departmet, sink) {
      if (departmet.isNotEmpty) {
        sink.add(departmet);
      } else {
        sink.addError('Departamento incorrecto');
      }
    },
  );

  final validateGender = StreamTransformer<String, String>.fromHandlers(
    handleData: (gender, sink) {
      if (gender.isNotEmpty) {
        sink.add(gender);
      } else {
        sink.addError('Genero incorrecto');
      }
    },
  );

  final validateCountry = StreamTransformer<String, String>.fromHandlers(
    handleData: (country, sink) {
      if (country.isNotEmpty) {
        sink.add(country);
      } else {
        sink.addError('Pais no válido');
      }
    },
  );

  final validateState = StreamTransformer<String, String>.fromHandlers(
    handleData: (state, sink) {
      if (state.isNotEmpty) {
        sink.add(state);
      } else {
        sink.addError('Estado no válido');
      }
    },
  );

  final validateDate = StreamTransformer<String, String>.fromHandlers(
    handleData: (date, sink) {
      if (date.isNotEmpty) {
        sink.add(date);
      } else {
        sink.addError('Fecha no válida');
      }
    },
  );
}
