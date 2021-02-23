import 'dart:convert';

List<EmployeeResponse> employeeResponseFromJson(String str) =>
    List<EmployeeResponse>.from(
        json.decode(str).map((x) => EmployeeResponse.fromJson(x)));

String employeeResponseToJson(List<EmployeeResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeResponse {
  EmployeeResponse({
    this.pkEmpleado,
    this.nombre,
    this.departamento,
    this.sexo,
    this.fechaIngreso,
    this.pais,
    this.estado,
  });

  String pkEmpleado;
  String nombre;
  String departamento;
  String sexo;
  String fechaIngreso;
  String pais;
  String estado;

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      EmployeeResponse(
        pkEmpleado: json["PKEmpleado"],
        nombre: json["Nombre"],
        departamento: json["Departamento"],
        sexo: json["Sexo"],
        fechaIngreso: json["FechaIngreso"],
        pais: json["Pais"],
        estado: json["Estado"],
      );

  Map<String, dynamic> toJson() => {
        "PKEmpleado": pkEmpleado,
        "Nombre": nombre,
        "Departamento": departamento,
        "Sexo": sexo,
        "FechaIngreso": fechaIngreso,
        "Pais": pais,
        "Estado": estado,
      };
}
