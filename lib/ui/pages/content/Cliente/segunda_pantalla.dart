import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListState();
}

class _ProductListState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DIRECCION DE ENTREGA"),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
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
                        labelText: "Buscar Direccion de Entrega",
                        hintText:
                            "Escribe el nombre de una de las direcciones que has guardado"),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Direccion presionada");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Usar ubicacion Actual"),
                    Text("Activar localizacion")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Ubicaciones Guardadas:"),
            SizedBox(
              width: 300,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Direccion presionada");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [Text("Casa"), Text("Direccion de la casa")],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Direccion presionada");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Casa de la Abuela"),
                    Text("Direccion de la casa de la abuela")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Direccion presionada");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("La universidad"),
                    Text("ojala dejaran pasar los mekatos")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Direccion presionada");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Biblioteca"),
                    Text("porque estas armando el mercadito en la biblioteca?")
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Direccion presionada");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Estadio Metropolitano"),
                    Text("porque miras muchos partidos del junior")
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
