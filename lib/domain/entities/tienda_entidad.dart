import 'package:f_testing_template/domain/entities/producto_entidad.dart';

class TiendaEnt {
  TiendaEnt({
    this.id = "",
    /* this.name = "",
    this.type = "",
    this.email = "",
    this.password = "",
    this.picture = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Sortavala_market_place.jpg/220px-Sortavala_market_place.jpg",
    this.dir = "", */
  });

  String id;
  String name = "";
  String type = "";
  String email = "";
  String password = "";
  String picture =
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Sortavala_market_place.jpg/220px-Sortavala_market_place.jpg";
  String dir = "";
  // List<ProductoEnt>? productos;
  var productos = <ProductoEnt>[
    ProductoEnt(
        name: 'Manzana',
        type: 'fruta',
        picture: 'picture',
        peso: 20,
        cantidad: 2,
        precio: 10),
    ProductoEnt(
        name: 'Piña',
        type: 'fruta',
        picture: 'picture',
        peso: 40,
        cantidad: 1,
        precio: 30)
  ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'email': email,
      'password': password,
      'picture': picture,
      'dir': dir,
      'productos': productos
    };
  }
}
