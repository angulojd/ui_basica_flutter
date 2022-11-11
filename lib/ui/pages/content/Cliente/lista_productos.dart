import 'package:f_testing_template/ui/pages/content/Cliente/segunda_pantalla.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/shopping_cart.dart';
import 'package:flutter/material.dart';

class ListedProductsPage extends StatefulWidget {
  const ListedProductsPage({super.key});

  @override
  State<ListedProductsPage> createState() => _ListedProductsPageState();
}

class _ListedProductsPageState extends State<ListedProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PRODUCTOS"),
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
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 150,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("a");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.apple, size: 40),
                          const Text("Manzana(Kg)"),
                          const Text("Precio: 1387/Kg"),
                          const Text("Tienda los toros"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.remove),
                              Text("1"),
                              Icon(Icons.add)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("a");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.apple, size: 40),
                          const Text("Manzana(Kg)"),
                          const Text("Precio: 1387/Kg"),
                          const Text("Tienda los toros"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.remove),
                              Text("1"),
                              Icon(Icons.add)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 150,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("a");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.apple, size: 40),
                          const Text("Manzana(Kg)"),
                          const Text("Precio: 1387/Kg"),
                          const Text("Tienda los toros"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.remove),
                              Text("1"),
                              Icon(Icons.add)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: 135,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("a");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.apple, size: 40),
                          const Text("Manzana(Kg)"),
                          const Text("Precio: 1387/Kg"),
                          const Text("Tienda los toros"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.remove),
                              Text("1"),
                              Icon(Icons.add)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
