import 'package:firebase_database/firebase_database.dart';

class ProductoEnt {
  ProductoEnt({
    this.dueno,
    required this.name,
    required this.type,
    required this.peso,
    required this.cantidad,
    required this.precio,
  });

  String id = ''; 
  String? key;
  String name;
  String type;
  String peso;
  String cantidad;
  String precio;
  String? dueno;
  
    ProductoEnt.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        dueno = json['dueno'] ?? "dueno", 
        peso = json['peso'] ?? "peso",
        type = json['tipo'] ?? 'tipo',
        name = json['nombre'] ?? 'nombre',
        cantidad = json['cantidad'] ?? 'cantidad',
        precio = json['precio'] ?? 'precio',
        id = json['pid'] ?? 'pid';


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'peso': peso,
      'cantidad': cantidad,
      'precio':precio
    };
  }
}