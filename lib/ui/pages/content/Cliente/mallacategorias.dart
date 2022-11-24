import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/productos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryGridView extends StatefulWidget {
  const CategoryGridView({Key? key, required this.producto}) : super(key: key);

  final ProductoEnt producto;

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  ProductoDB productController = Get.find();
  AuthService auth = AuthService();
  get products => productController.allproducts();

  ProductoEnt obteniendoproduct(products) {
    return products.firstWhere((p) => p.id == widget.producto.id);
    // return products.firstWhere((element) => element.dueno == widget.entidad.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF00BE5D),
      child: ElevatedButton(
        onPressed: () {
          debugPrint("presionaste el boton" + widget.producto.type);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ProductList(categoria: widget.producto.type);
              },
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.producto.type),
          ],
        ),
      ),
    );
  }
}
