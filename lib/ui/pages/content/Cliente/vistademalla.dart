import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/Lista.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsGridView extends StatefulWidget {
  const ProductsGridView({Key? key, required this.producto}) : super(key: key);

  final ProductoEnt producto;

  @override
  State<ProductsGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductsGridView> {
  final hola = TextEditingController();
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
          openDialog();
          debugPrint("presionaste el boton " + widget.producto.name);
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

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("¿Cuantas Unidades Quieres?"),
          content: TextField(
            controller: hola,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(hintText: "Ingresa la cantidad a pedir"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                debugPrint(
                    "haz pedido ${hola.text} Unidades de ${widget.producto.name} con codigo ${widget.producto.id}");
                Listilla.nombrescarrito.add(widget.producto.name);
                Listilla.cantidadescarrito.add(hola.text);
                Listilla.codigoscarrito.add(widget.producto.id);
                Navigator.of(context).pop();
              },
              child: const Text("submit"),
            )
          ],
        ),
      );
}
