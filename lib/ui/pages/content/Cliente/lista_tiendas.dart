import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/segunda_pantalla.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/shopping_cart.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/vista_categorias.dart';
import 'package:flutter/material.dart';

class ListTiendas extends StatefulWidget {
  const ListTiendas({super.key});

  @override
  State<ListTiendas> createState() => _ListTiendasState();
}

class _ListTiendasState extends State<ListTiendas> {
  @override
  final AuthService _auth = AuthService();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TIENDAS"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            await _auth.signOut();
            //Navigator.of(context).pop();
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
                Text("Tiendas Disponibles:"),
                SizedBox(width: 100),
                SizedBox(width: 100),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CategoryViewPage();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.local_police,
                      size: 50,
                    ),
                    Column(
                      children: const [
                        Text("Tienda los toros"),
                        Text("Cra 43 # 45-98"),
                        Text("7.2* / 1.5km ")
                      ],
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CategoryViewPage();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.local_pharmacy,
                      size: 50,
                    ),
                    Column(
                      children: const [
                        Text("Tienda los pericos"),
                        Text("Cra 34 # 84-47"),
                        Text("9.0* / 3.4km ")
                      ],
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const CategoryViewPage();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.shield,
                      size: 50,
                    ),
                    Column(
                      children: const [
                        Text("Tienda La Nacional"),
                        Text("Cra 12 # 78-105"),
                        Text("10.0* / 5km ")
                      ],
                    ),
                    const Icon(
                      Icons.favorite_border,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
