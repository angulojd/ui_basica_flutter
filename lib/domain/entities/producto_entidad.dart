
class ProductoEnt {
  ProductoEnt({
    this.id,
    required this.name,
    required this.type,
    required this.picture,
    required this.peso,
    required this.cantidad,
    required this.precio,
  });

  int? id;
  String name;
  String type;
  String picture;
  int peso;
  int cantidad;
  double precio;
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'picture': picture,
      'peso': peso,
      'cantidad': cantidad,
      'precio':precio
    };
  }
}