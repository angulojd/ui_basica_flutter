import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/tienda_entidad.dart';

class ListaProductosT extends StatelessWidget {
  const ListaProductosT({Key? key, required this.producto}) : super(key: key);

  final ProductoEnt producto;

  @override
  Widget build(BuildContext context) {
    //UserController userController = Get.find();
    int id = producto.id ?? 0;
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Deleting",
                style: TextStyle(color: Colors.white),
              ),
            )),
        onDismissed: (direction) {
          // Remove the item from the data source.
          //userController.deleteUser(user.id);
        },
        child: Card(
          key: Key('tiendaItem$id'),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text(producto.name),
            Text(producto.precio.toString()),
            Column(
              children: [
                IconButton(
                    onPressed: () => {/* controller.updatecantidad(index) */},
                    icon: const Icon(Icons.arrow_upward)),
                IconButton(
                    onPressed: () => {/* controller.downdatecantidad(index) */},
                    icon: const Icon(Icons.arrow_downward))
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Cantidad"),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: /* Obx(() => */
                        Text(producto.cantidad.toString())
                        // )
                        ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
