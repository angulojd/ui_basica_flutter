import 'package:f_testing_template/services/auth.dart';
import 'package:f_testing_template/services/productodb.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/carrito.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/pedidoencamino.dart';
import 'package:f_testing_template/ui/pages/content/Cliente/recibo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:f_testing_template/domain/entities/producto_entidad.dart';
import 'metodo_pago.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({super.key});

  @override
  State<DeliveryDetails> createState() => NameState();
}

class NameState extends State<DeliveryDetails> {
  @override
  AuthService _auth = AuthService();
  ProductoDB prodcontroller = Get.find();
  get products => prodcontroller.allproducts();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COMPRUEBA TU PEDIDO"),
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
          child: Column(children: [
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
                      children: [
                        const Text("Fecha de entrega"),
                        Text(Recibo.dia),
                        Text(Recibo.hora),
                      ],
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                        Text("Cra 71 #23-22"),
                      ],
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                      children: [
                        const Text("Metodo de Pago"),
                        Text(Recibo.metopago),
                      ],
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
                child: SizedBox(width: 600, height: 280, child: generador())),
          ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("¿Todo Listo?"),
            Text("Precio Total: \$${Recibo.total}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return OnitsWay();
                      },
                    ),
                  );
                },
                child: const Text("Continuar"))
          ],
        ),
      ),
    );
  }

  Widget generador() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      itemCount: Recibo.nombreproducto.length,
      itemBuilder: (context, index) {
        final name = Recibo.nombreproducto[index];
        final store = Recibo.nombretienda[index];
        final cuant = Recibo.cantidadproducto[index];
        final price = Recibo.precioorden[index];
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Carrito(
              nombre: name,
              tienda: store,
              cantidad: cuant,
              precio: price.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
