import 'package:flutter/material.dart';

class ListTiendas extends StatefulWidget {
  const ListTiendas({super.key});

  @override
  State<ListTiendas> createState() => _ListTiendasState();
}

class _ListTiendasState extends State<ListTiendas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Vista de Cliente"),
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
                width: 400,
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint("you have pressed store 1");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.local_police),
                        Column(
                          children: const [
                            Text("Tienda los toros"),
                            Text("Cra 43 # 45-98"),
                            Text("7.2* / 1.5km ")
                          ],
                        ),
                        const Icon(Icons.favorite)
                      ],
                    )),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint("you have pressed store 1");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.local_pharmacy),
                        Column(
                          children: const [
                            Text("Tienda los pericos"),
                            Text("Cra 34 # 84-47"),
                            Text("9.0* / 3.4km ")
                          ],
                        ),
                        const Icon(Icons.favorite)
                      ],
                    )),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint("you have pressed store 1");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.shield),
                        Column(
                          children: const [
                            Text("Tienda La Nacional"),
                            Text("Cra 12 # 78-105"),
                            Text("10.0* / 5km ")
                          ],
                        ),
                        const Icon(Icons.favorite)
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
