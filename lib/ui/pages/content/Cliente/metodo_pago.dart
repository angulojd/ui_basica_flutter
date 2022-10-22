import 'package:f_testing_template/ui/pages/content/Cliente/detalles_pedido.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => NameState();
}

class NameState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("METODO DE PAGO"),
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
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Pago seguro en linea:"),
                    Icon(Icons.lock)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.credit_card),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Tarjeta de credito o debito"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const[
                      Icon(Icons.square_outlined),
                      Text("Nequi")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const[
                      Icon(Icons.house),
                      Text("Daviplata")
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Pago en efectivo"),
                    Icon(Icons.money)
                  ],
                ),
              ),
               const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const[
                      Icon(Icons.monetization_on),
                      Text("Efectivo")
                    ],
                  ),
                ),
              ),
              
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
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const DeliveryDetails();
                  },
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
