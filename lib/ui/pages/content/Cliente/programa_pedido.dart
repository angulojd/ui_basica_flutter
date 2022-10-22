import 'package:f_testing_template/ui/pages/content/Cliente/metodo_pago.dart';
import 'package:flutter/material.dart';

import 'detalles_pedido.dart';

class DeliverySchedulePage extends StatefulWidget {
  const DeliverySchedulePage({super.key});

  @override
  State<DeliverySchedulePage> createState() => _DeliverySchedulePageState();
}

class _DeliverySchedulePageState extends State<DeliverySchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PROGRAMA TU PEDIDO"),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  debugPrint("hola1");
                },
                child: SizedBox(
                  width: 200,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.location_on_outlined),
                      Text("Cra 71 #23-87"),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 80,
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        debugPrint("hola2");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Hoy"),
                          Text("Sept 21"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint("hola2");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Martes"),
                          Text("Sept 21"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        debugPrint("hola2");
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Miercoles"),
                          Text("Sept 21"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: () {}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Icon(Icons.circle),
                    Text("7:00am-8:00am"),
                  ],
                )),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: () {}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Icon(Icons.circle),
                    Text("8:00am-9:00am"),
                  ],
                )),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: () {}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Icon(Icons.circle),
                    Text("9:00am-10:00am"),
                  ],
                )),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: () {}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Icon(Icons.circle),
                    Text("10:00am-11:00am"),
                  ],
                )),
              ),

              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 300,
                child: ElevatedButton(onPressed: () {}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const[
                    Icon(Icons.circle),
                    Text("11:00am-12:00pm"),
                  ],
                )),
              ),
              const SizedBox(height: 20),
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
