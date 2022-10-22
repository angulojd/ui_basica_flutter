import 'package:f_testing_template/domain/entities/producto_entidad.dart';

class TiendaEnt {
  TiendaEnt({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.picture,
    required this.dir,
  });

  int? id;
  String name;
  String type = 'Tienda';
  String email;
  String password;
  String picture;
  String dir;
  // List<ProductoEnt>? productos;
  var productos = <ProductoEnt>[ProductoEnt(name: 'Manzana', type: 'fruta', picture: 'picture', peso: 20, cantidad: 2, precio: 10),
                                ProductoEnt(name: 'Piña', type: 'fruta', picture: 'picture', peso: 40, cantidad: 1, precio: 30)];

  
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'picture': picture,
      'dir': dir,
      'productos':productos
    };
  }
}