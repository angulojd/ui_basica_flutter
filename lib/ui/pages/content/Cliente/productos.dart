import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/segunda_pantalla.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/lista_productos_t.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _TiendaListProdutsState();
}

class _TiendaListProdutsState extends State<ProductList> {
  final AuthService auth = AuthService();
  ProductoDB productoController = Get.find();
  get products => productoController.allproducts();

  List<ProductoEnt> obteniendouserproducts(products) {
    return products.where((p) => p.dueno == p.dueno).toList();
    // return products.firstWhere((element) => element.dueno == widget.entidad.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Productos"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ProductListPage();
                  },
                ),
              );
            },
            child: const Text(
              "Cra 70 #41-9",
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const ShoppingCartPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.shopping_basket_outlined),
          )
        ],
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
          itemCount: obteniendouserproducts(products).length,
          itemBuilder: (context, index) {
            final producto = obteniendouserproducts(products)[index];
            return ListaProductosT(producto: producto);
          },
        ));
  }
}
