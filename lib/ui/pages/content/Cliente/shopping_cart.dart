import 'package:f_testing_template/ui/pages/content/Cliente/programa_pedido.dart';
import 'package:flutter/material.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CARRITO DE COMPRAS"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("youhavepressed de butown");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.apple,
                        size: 40,
                      ),
                      Column(
                        children: const [
                          Text("Frutas"),
                          Text("Manzanas(Kg)"),
                          Text("Precio: 1843/Kg")
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.add),
                          Text("1"),
                          Icon(Icons.remove)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("youhavepressed de butown");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.breakfast_dining,
                        size: 40,
                      ),
                      Column(
                        children: const [
                          Text("Pan"),
                          Text("Croissant(Precio por unidad)"),
                          Text("Precio: 1500/Kg")
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.add),
                          Text("4"),
                          Icon(Icons.remove)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("vendido");
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.delete_forever_outlined),
                      Text("Vender Carrito")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Pide Tambien"),
              const SizedBox(height: 20),
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
                                debugPrint("debugdebug");
                              },
                              child: const Icon(
                                Icons.wind_power_sharp,
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
                                debugPrint("debugdebug");
                              },
                              child: const Icon(
                                Icons.ondemand_video,
                                size: 50,
                              )),
                        ),
                        const Text("Televisores")
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text("Total:"),
                Text("7843"),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Desea programar su pedido?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Aun no..."),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {                   
                                return const DeliverySchedulePage();
                              },
                            ),
                          );
                        },
                        child: const Text("Programalo!"),
                      )
                    ],
                  ),
                );
              },
              child: const Text("Continuar"),
            ),
          ],
        ),
      ),
    );
  }
}
