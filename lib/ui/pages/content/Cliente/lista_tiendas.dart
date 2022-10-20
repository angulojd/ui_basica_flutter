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
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("This is line 1 Store 1"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text("This is line 2 Store 1"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("you have pressed store 1");
                  },
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("This is line 1 Store 1"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text("This is line 2 Store 1"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("you have pressed store 1");
                  },
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("This is line 1 Store 1"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text("This is line 2 Store 1"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("you have pressed store 1");
                  },
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("This is line 1 Store 1"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text("This is line 2 Store 1"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("you have pressed store 1");
                  },
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("This is line 1 Store 1"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text("This is line 2 Store 1"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint("you have pressed store 1");
                  },
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Text("This is line 1 Store 1"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text("This is line 2 Store 1"),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
