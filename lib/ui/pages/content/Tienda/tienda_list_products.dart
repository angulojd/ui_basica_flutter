import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/services/realdb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/tienda_entidad.dart';
import '../../../widgets/lista_productos_t.dart';
import 'add_product.dart';

class TiendaListProduts extends StatefulWidget {
  const TiendaListProduts({Key? key, required this.entidad}) : super(key: key);

  final TiendaEnt entidad;

  @override
  State<TiendaListProduts> createState() => _TiendaListProdutsState();
}

class _TiendaListProdutsState extends State<TiendaListProduts> {
  final AuthService auth = AuthService();
  RealTimeDB dbController = Get.find();
  ProductoDB productoController = Get.find();

  get users => dbController.allUsers();
  get products => productoController.allproducts();

  List<ProductoEnt> obteniendouserproducts(products) {
    return products.where((p) => p.dueno == widget.entidad.id).toList();
    // return products.firstWhere((element) => element.dueno == widget.entidad.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Mis Productos",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                iconSize: 25,
                tooltip: 'Borrar Todo',
                key: const Key('deleteAllButton'),
                onPressed: () {
                  productoController.deleteallproductsuser(widget.entidad.id);
                  //userController.deleteAll();
                },
                icon: const Icon(Icons.delete))
          ]),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Añadir Producto',
        backgroundColor: const Color(0xFF00BE5D),
        key: const Key('addProductButton'),
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () async {
          Get.to(() => const AddProductT());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _getXlistView(),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(() => ListView.builder(
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          itemCount: obteniendouserproducts(products).length - 1,
          itemBuilder: (context, index) {
            final producto = obteniendouserproducts(products)[index];
            return ListaProductosT(producto: producto);
          },
        ));
  }
}
