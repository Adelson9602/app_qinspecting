import 'dart:convert';

class Vehiculo {
  Vehiculo({
    required this.placa,
    required this.idTpVehiculo,
    required this.modelo,
    required this.nombreMarca,
    required this.color,
    this.licenciaTransito,
  });

  String placa;
  int idTpVehiculo;
  int modelo;
  String nombreMarca;
  String color;
  String? licenciaTransito;

  factory Vehiculo.fromJson(String str) => Vehiculo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vehiculo.fromMap(Map<String, dynamic> json) => Vehiculo(
        placa: json["placa"],
        idTpVehiculo: json["idTpVehiculo"],
        modelo: json["modelo"],
        nombreMarca: json["nombreMarca"],
        color: json["color"],
        licenciaTransito: json["licenciaTransito"],
      );

  Map<String, dynamic> toMap() => {
    "placa": placa,
    "idTpVehiculo": idTpVehiculo,
    "modelo": modelo,
    "nombreMarca": nombreMarca,
    "color": color,
    "licenciaTransito": licenciaTransito,
  };
}
