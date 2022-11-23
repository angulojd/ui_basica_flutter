import 'package:f_testing_template/ui/pages/content/Cliente/lista_productos.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/productos.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/segunda_pantalla.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/shopping_cart.dart';
import 'package:flutter/material.dart';

class CategoryViewPage extends StatefulWidget {
  const CategoryViewPage({super.key});

  @override
  State<CategoryViewPage> createState() => _CategoryViewPageState();
}

class _CategoryViewPageState extends State<CategoryViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CATEGORIAS"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
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
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Categorias Disponibles:"),
                SizedBox(width: 100),
                SizedBox(width: 100),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const ProductList();
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.apple,
                              size: 50,
                            )),
                      ),
                      const Text("Frutas")
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const ListedProductsPage();
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.wind_power_outlined,
                              size: 50,
                            )),
                      ),
                      const Text("Abanicos")
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const ListedProductsPage();
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.wine_bar,
                              size: 50,
                            )),
                      ),
                      const Text("Vinos")
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 80,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const ListedProductsPage();
                                  },
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.attach_file_sharp,
                              size: 50,
                            )),
                      ),
                      const Text("Clips")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
