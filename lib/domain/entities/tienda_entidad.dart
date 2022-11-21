
import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:firebase_database/firebase_database.dart';

class TiendaEnt {

  String id;
  String? key;
  String name = "";
  String type = "";
  String email = "";
  String password = "";
  String picture ="https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Sortavala_market_place.jpg/220px-Sortavala_market_place.jpg";
  String dir = "";
  List<dynamic> dataList = [];


  TiendaEnt({this.id = ""});
  TiendaEnt.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : key = snapshot.key ?? "0",
        email = json['email'] ?? "email",
        type = json['type'] ?? 'type',
        name = json['nombre'] ?? 'nombre',
        password = json['password'] ?? 'password',
        dir = json['dir'] ?? 'dir',
        id = json['uid'] ?? 'uid';

  
  // List<ProductoEnt>? productos;
  var productos = <ProductoEnt>[
    ProductoEnt(
        name: 'Manzana',
        type: 'fruta',
        peso: '20',
        cantidad: '2',
        precio: '10'),
    ProductoEnt(
        name: 'Piña',
        type: 'fruta',
        peso: '40',
        cantidad: '1',
        precio: '30')
  ];

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'email': email,
      'type': type,
      'name': name,
      'password': password,
      'dir': dir,
      'id': id
    };
  }
}
