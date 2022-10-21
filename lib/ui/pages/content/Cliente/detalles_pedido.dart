import 'package:flutter/material.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => _nameState();
}

class _nameState extends State<DeliveryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COMPRUEBA TU PEDIDO"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  height: 80,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.alarm),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Fecha de entrega"),
                          Text("Martes, 20 de Septiembre"),
                          Text("10:00am"),
                        ],
                      ),
                      const Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  height: 80,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.location_on),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Direccion de entrega"),
                          Text("En la Casa"),
                          Text("Cra 71 #23-22"),
                        ],
                      ),
                      const Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: SizedBox(
                  height: 80,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.money),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Metodo de Pago"),
                          Text("Efectivo"),
                        ],
                      ),
                      const Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                    height: 150,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text("Orden #3609"),
                        const Text("Hoy"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const[
                            Text("Manzana (1Kg)"),
                            Text("Precio: 1783/Kg"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const[
                            Text("Bolsa de plastico (1U)"),
                            Text("Precio: 50"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const[
                            Text("Domicilio Gratis"),
                            Text("Precio: 0"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const[
                            Text("Total"),
                            Text("Un poco e plata"),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
