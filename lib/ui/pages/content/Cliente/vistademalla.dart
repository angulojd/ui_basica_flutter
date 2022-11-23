import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key, required this.producto}) : super(key: key);

  final ProductoEnt producto;

  @override
  State<ProductsGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductsGridView> {
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
          debugPrint("presionaste el boton" + widget.producto.name);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.producto.name),
            Text(widget.producto.precio),
            Text(widget.producto.peso)
          ],
        ),
      ),
    );
  }
}
