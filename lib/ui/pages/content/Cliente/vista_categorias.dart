import 'package:f_testing_template/ui/pages/content/Cliente/lista_productos.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/mallacategorias.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/productos.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/segunda_pantalla.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/shopping_cart.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/vistademalla.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/producto_entidad.dart';
import '../../../../services/auth.dart';
import '../../../../services/productodb.dart';

class CategoryViewPage extends StatefulWidget {
  const CategoryViewPage({super.key});

  @override
  State<CategoryViewPage> createState() => _CategoryViewPageState();
}

class _CategoryViewPageState extends State<CategoryViewPage> {
  final AuthService auth = AuthService();
  ProductoDB productoController = Get.find();
  get products => productoController.allproducts();

  List<ProductoEnt> obteniendouserproducts(products) {
    var visto = Set<String>();
    List<ProductoEnt> lista = products.where((p) => visto.add(p.type)).toList();
    return lista;
    // return products.firstWhere((element) => element.dueno == widget.entidad.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            AuthService().signOut();
          },
          icon: const Icon(Icons.logout),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Que Desea buscar?",
                        hintText: "Escribe un producto que quieras comprar"),
                  ),
                ),
                Icon(Icons.search),
                Icon(Icons.settings_outlined)
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _getXlistView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(() => GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12),
          padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          itemCount: obteniendouserproducts(products).length,
          itemBuilder: (context, index) {
            final producto = obteniendouserproducts(products)[index];
            return CategoryGridView(producto: producto);
          },
        ));
  }
}
