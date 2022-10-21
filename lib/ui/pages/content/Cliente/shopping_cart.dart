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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                debugPrint("presionado");
              },
              child: SizedBox(
                width: 300,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.apple),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Frutas"),
                            Text("Manzana (1Kg)"),
                            Text("Precio: 1837/kg"),
                          ],
                        ),
                        const Text("7")
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                debugPrint("presionado");
              },
              child: SizedBox(
                width: 300,
                height: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.local_police),
                    Column(
                      children: [
                        const Icon(Icons.apple),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("Carnes"),
                            Text("Pollo (1Kg)"),
                            Text("Precio: 1950/kg"),
                          ],
                        ),
                        const Text("7")
                      ],
                    ),
                    const Icon(Icons.favorite)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
